import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:your_app_name/db/firebase_service.dart';
import 'package:your_app_name/db/init_database.dart';

class CustomFabLocation extends FloatingActionButtonLocation {
  final double xOffset;
  final double yOffset;

  CustomFabLocation(this.xOffset, this.yOffset);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = xOffset;
    final double fabY = scaffoldGeometry.scaffoldSize.height - yOffset;
    return Offset(fabX, fabY);
  }
}

class ComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  final FirebaseService _firebaseService = FirebaseService();
  String? selectedPanchayathId;
  String? selectedPanchayathName;

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFE8F5E9),
      appBar: AppBar(
        title: Text('Kozhikode Panchayath Complaints'),
        backgroundColor: Color(0xFFE8F5E9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Add this button during development
            // ElevatedButton(
            //   onPressed: () async {
            //     await initializeDatabase();
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Database initialized')),
            //     );
            //   },
            //   child: Text('Initialize Database'),
            // ),
            StreamBuilder<QuerySnapshot>(
              stream: _firebaseService.getPanchayaths(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                List<DropdownMenuItem<String>> panchayathItems =
                    snapshot.data!.docs.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  return DropdownMenuItem(
                    value: doc.id,
                    child: Text(data['name']),
                  );
                }).toList();

                return DropdownButtonFormField<String>(
                  dropdownColor: Color(0xFFE8F5E9),
                  decoration: InputDecoration(
                      labelText: 'Select Panchayath',
                      border: OutlineInputBorder(),
                      focusColor: Color(0x118B50),
                      hoverColor: Color(0x118B50)),
                  value: selectedPanchayathId,
                  items: panchayathItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedPanchayathId = newValue;
                      selectedPanchayathName = panchayathItems
                          .firstWhere((item) => item.value == newValue)
                          .child
                          .toString();
                    });
                  },
                );
              },
            ),

            SizedBox(height: 20),

            // Complaints List
            Expanded(
              child: selectedPanchayathId == null
                  ? Center(child: Text('Please select a panchayath'))
                  : StreamBuilder<QuerySnapshot>(
                      stream:
                          _firebaseService.getComplaints(selectedPanchayathId!),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Color(0x118B50),
                          ));
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No complaints found'));
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final doc = snapshot.data!.docs[index];
                            final data = doc.data() as Map<String, dynamic>;

                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                title: Text(data['description']),
                                subtitle: Text('Status: ${data['status']}\n'
                                    'Date: ${DateTime.parse(data['dateSubmitted']).toString().split('.')[0]}'),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: selectedPanchayathId == null
          ? null
          : FloatingActionButton(
              backgroundColor: Color(0xFF526732),
              onPressed: () => _showAddComplaintDialog(context),
              child: Icon(Icons.add),
              tooltip: 'Add New Complaint',
              isExtended: true,
            ),
      floatingActionButtonLocation:
          CustomFabLocation(screenW * 0.8, screenH * 0.25),
    );
  }

  void _showAddComplaintDialog(BuildContext context) {
    final TextEditingController _complaintController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('New Complaint for $selectedPanchayathName'),
        content: TextField(
          controller: _complaintController,
          decoration: InputDecoration(
            labelText: 'Complaint Description',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () async {
              if (_complaintController.text.isNotEmpty) {
                await _firebaseService.addComplaint(
                  selectedPanchayathId!,
                  _complaintController.text,
                );
                Navigator.pop(context);
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
