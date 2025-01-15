import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final String apiKey = 'KNllPM6B6IFIQe59ghDK02_9GK3uYN55kaapV4jpaNg'; // Replace with your HERE API key
  TextEditingController startLocationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  String? trafficInfo;
  bool isLoading = false;
  List<String> suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic Updates'),
        backgroundColor: Color(0xFFE8F5E9),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFE8F5E9),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildLocationInput(
              controller: startLocationController,
              label: 'Start Location',
              isStart: true,
            ),
            SizedBox(height: 16),
            _buildLocationInput(
              controller: destinationController,
              label: 'Destination',
              isStart: false,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getTrafficInfo,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), backgroundColor: Colors.green,
              ),
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Check Traffic'),
            ),
            SizedBox(height: 20),
            if (trafficInfo != null)
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      trafficInfo!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInput({
    required TextEditingController controller,
    required String label,
    required bool isStart,
  }) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: Icon(Icons.location_on),
          ),
          onChanged: (value) => _searchLocation(value, isStart),
        ),
        if (suggestions.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 4),
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(suggestions[index]),
                  onTap: () {
                    setState(() {
                      controller.text = suggestions[index];
                      suggestions = [];
                    });
                  },
                );
              },
            ),
          ),
      ],
    );
  }

  Future<void> _searchLocation(String query, bool isStart) async {
    if (query.length < 3) return;

    final url = Uri.parse(
      'https://geocode.search.hereapi.com/v1/geocode'
      '?q=$query'
      '&apiKey=$apiKey'
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          suggestions = (data['items'] as List)
              .map((item) => item['address']['label'] as String)
              .toList();
        });
      }
    } catch (e) {
      print('Error searching location: $e');
    }
  }

  Future<void> _getTrafficInfo() async {
    if (startLocationController.text.isEmpty ||
        destinationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both locations')),
      );
      return;
    }

    setState(() {
      isLoading = true;
      trafficInfo = null;
    });

    try {
      // Get coordinates for start location
      final startCoords = await _getCoordinates(startLocationController.text);
      // Get coordinates for destination
      final destCoords = await _getCoordinates(destinationController.text);

      if (startCoords != null && destCoords != null) {
        // Get route with traffic information
        await _getRouteWithTraffic(startCoords, destCoords);
      }
    } catch (e) {
      setState(() {
        trafficInfo = 'Error: Unable to get traffic information';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<Map<String, double>?> _getCoordinates(String address) async {
    final url = Uri.parse(
      'https://geocode.search.hereapi.com/v1/geocode'
      '?q=${Uri.encodeComponent(address)}'
      '&apiKey=$apiKey'
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['items'].isNotEmpty) {
          final position = data['items'][0]['position'];
          return {
            'lat': position['lat'],
            'lng': position['lng'],
          };
        }
      }
    } catch (e) {
      print('Error getting coordinates: $e');
    }
    return null;
  }

  Future<void> _getRouteWithTraffic(
      Map<String, double> start, Map<String, double> dest) async {
    final url = Uri.parse(
      'https://router.hereapi.com/v8/routes'
      '?transportMode=car'
      '&origin=${start['lat']},${start['lng']}'
      '&destination=${dest['lat']},${dest['lng']}'
      '&return=summary,actions,incidents'
      '&apiKey=$apiKey'
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final route = data['routes'][0]['sections'][0];
        
        // Get traffic incidents
        final incidentsUrl = Uri.parse(
          'https://traffic.ls.hereapi.com/traffic/6.2/incidents.json'
          '?corridor=${start['lat']},${start['lng']};${dest['lat']},${dest['lng']};50'
          '&apiKey=$apiKey'
        );
        
        final incidentsResponse = await http.get(incidentsUrl);
        final incidentsData = json.decode(incidentsResponse.body);

        setState(() {
          trafficInfo = '''
Route Summary:
Distance: ${(route['summary']['length'] / 1000).toStringAsFixed(2)} km
Estimated Time: ${(route['summary']['duration'] / 60).toStringAsFixed(0)} minutes

Traffic Conditions:
${_parseTrafficIncidents(incidentsData)}
''';
        });
      }
    } catch (e) {
      setState(() {
        trafficInfo = 'Error: Unable to get route information';
      });
    }
  }

  String _parseTrafficIncidents(Map<String, dynamic> incidentsData) {
    if (!incidentsData.containsKey('TRAFFIC_ITEMS') ||
        incidentsData['TRAFFIC_ITEMS']['TRAFFIC_ITEM'] == null ||
        incidentsData['TRAFFIC_ITEMS']['TRAFFIC_ITEM'].isEmpty) {
      return 'No traffic incidents reported';
    }

    final incidents = incidentsData['TRAFFIC_ITEMS']['TRAFFIC_ITEM'] as List;
    return incidents
        .map((incident) =>
            '- ${incident['TRAFFIC_ITEM_TYPE_DESC']}: ${incident['DESCRIPTION']['value']}')
        .join('\n');
  }
}