import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  

  // Get all panchayaths
  Stream<QuerySnapshot> getPanchayaths() {
    return _firestore
        .collection('panchayaths')
        .orderBy('name')
        .snapshots();
  }

  // Get complaints for a specific panchayath
  Stream<QuerySnapshot> getComplaints(String panchayathId) {
    return _firestore
        .collection('panchayaths')
        .doc(panchayathId)
        .collection('complaints')
        .orderBy('dateSubmitted', descending: true)
        .snapshots();
  }

  // Add a new complaint
  Future<void> addComplaint(String panchayathId, String description) async {
    try {
      await _firestore
          .collection('panchayaths')
          .doc(panchayathId)
          .collection('complaints')
          .add({
        'description': description,
        'dateSubmitted': DateTime.now().toIso8601String(),
        'status': 'pending',
      });
    } catch (e) {
      print('Error adding complaint: $e');
      rethrow;
    }
  }
}