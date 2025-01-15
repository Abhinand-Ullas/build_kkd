import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_icons/weather_icons.dart';

class UpdatesScreen extends StatefulWidget {
  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  final String apiKey = 'KNllPM6B6IFIQe59ghDK02_9GK3uYN55kaapV4jpaNg';
  final String weatherApiKey = 'YOUR_OPENWEATHER_API_KEY';
  TextEditingController startLocationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  String? trafficInfo;
  bool isLoading = false;
  bool isLoadingWeather = false;
  LatLng? selectedStartLocation;
  LatLng? selectedDestLocation;
  Map<String, dynamic>? weatherData;
  final LatLng kozhikodeLocation = LatLng(11.2588, 75.7804);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getWeatherData();
  }

  Future<void> _getWeatherData() async {
    setState(() {
      isLoadingWeather = true;
    });

    try {
      final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=11.2588&lon=75.7804&units=metric&appid=$weatherApiKey'
      ));

      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
          isLoadingWeather = false;
        });
      }
    } catch (e) {
      print('Error getting weather: $e');
      setState(() {
        isLoadingWeather = false;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition();
        setState(() {
          selectedStartLocation = LatLng(position.latitude, position.longitude);
        });
        _getAddressFromLatLng(position.latitude, position.longitude, true);
      }
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic & Weather Updates'),
        backgroundColor: Color(0xFFE8F5E9),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade300, Colors.blue.shade600],
                ),
              ),
              child: isLoadingWeather
                  ? Center(child: CircularProgressIndicator(color: Colors.white))
                  : weatherData != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kozhikode Weather',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${weatherData!['main']['temp'].round()}°C',
                                      style: TextStyle(
                                        fontSize: 36,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      weatherData!['weather'][0]['description']
                                          .toString()
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  _getWeatherIcon(
                                      weatherData!['weather'][0]['main']),
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildWeatherInfo(
                                  'Humidity',
                                  '${weatherData!['main']['humidity']}%',
                                  Icons.water_drop,
                                ),
                                _buildWeatherInfo(
                                  'Wind',
                                  '${weatherData!['wind']['speed']} m/s',
                                  Icons.air,
                                ),
                                _buildWeatherInfo(
                                  'Feels Like',
                                  '${weatherData!['main']['feels_like'].round()}°C',
                                  Icons.thermostat,
                                ),
                              ],
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                            'Unable to load weather data',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
            ),
            Container(
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
                    onPressed: isLoading ? null : _getTrafficInfo,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.green,
                    ),
                    child: isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Colors.white),
                          )
                        : Text('Check Traffic'),
                  ),
                  SizedBox(height: 20),
                  if (trafficInfo != null)
                    Container(
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
                      child: Text(
                        trafficInfo!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String mainCondition) {
    switch (mainCondition.toLowerCase()) {
      case 'clear':
        return Icons.wb_sunny;
      case 'clouds':
        return Icons.cloud;
      case 'rain':
        return Icons.beach_access;
      case 'thunderstorm':
        return Icons.flash_on;
      default:
        return Icons.wb_sunny;
    }
  }

  Widget _buildLocationInput({
    required TextEditingController controller,
    required String label,
    required bool isStart,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _showMapPicker(context, isStart),
          child: TextField(
            controller: controller,
            enabled: false,
            decoration: InputDecoration(
              labelText: label,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: Icon(Icons.map),
            ),
          ),
        ),
      ],
    );
  }

  void _showMapPicker(BuildContext context, bool isStart) {
    TextEditingController searchController = TextEditingController();
    List<dynamic> searchResults = [];
    bool isSearching = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search location...',
                              suffixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) async {
                              if (value.length > 2) {
                                setState(() => isSearching = true);
                                try {
                                  final searchUrl = Uri.parse(
                                    'https://geocode.search.hereapi.com/v1/geocode'
                                    '?q=${Uri.encodeComponent(value)}'
                                    '&apiKey=$apiKey'
                                  );
                                  
                                  final response = await http.get(searchUrl);
                                  if (response.statusCode == 200) {
                                    final data = json.decode(response.body);
                                    setState(() {
                                      searchResults = data['items'];
                                      isSearching = false;
                                    });
                                  }
                                } catch (e) {
                                  print('Search error: $e');
                                  setState(() => isSearching = false);
                                }
                              } else {
                                setState(() => searchResults = []);
                              }
                            },
                          ),
                          if (isSearching)
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          if (searchResults.isNotEmpty)
                            Container(
                              height: 200,
                              child: ListView.builder(
                                itemCount: searchResults.length,
                                itemBuilder: (context, index) {
                                  final result = searchResults[index];
                                  return ListTile(
                                    title: Text(result['title']),
                                    subtitle: Text(result['address']['label']),
                                    onTap: () {
                                      final position = result['position'];
                                      final point = LatLng(
                                        position['lat'],
                                        position['lng'],
                                      );
                                      setState(() {
                                        if (isStart) {
                                          selectedStartLocation = point;
                                        } else {
                                          selectedDestLocation = point;
                                        }
                                      });
                                      _getAddressFromLatLng(
                                        point.latitude,
                                        point.longitude,
                                        isStart,
                                      );
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FlutterMap(
                        options: MapOptions(
                          center: isStart
                              ? (selectedStartLocation ?? kozhikodeLocation)
                              : (selectedDestLocation ?? kozhikodeLocation),
                          zoom: 13.0,
                          onTap: (tapPosition, point) {
                            setState(() {
                              if (isStart) {
                                selectedStartLocation = point;
                              } else {
                                selectedDestLocation = point;
                              }
                            });
                            _getAddressFromLatLng(
                              point.latitude,
                              point.longitude,
                              isStart,
                            );
                            Navigator.pop(context);
                          },
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayer(
                            markers: [
                              if (selectedStartLocation != null)
                                Marker(
                                  point: selectedStartLocation!,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                ),
                              if (selectedDestLocation != null)
                                Marker(
                                  point: selectedDestLocation!,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _getAddressFromLatLng(
    double latitude,
    double longitude,
    bool isStart,
  ) async {
    try {
      final url = Uri.parse(
        'https://revgeocode.search.hereapi.com/v1/revgeocode'
        '?at=$latitude,$longitude'
        '&lang=en-US'
        '&apiKey=$apiKey'
      );

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final address = data['items'][0]['address']['label'];
        
        setState(() {
          if (isStart) {
            startLocationController.text = address;
          } else {
            destinationController.text = address;
          }
        });
      }
    } catch (e) {
      print('Error getting address: $e');
    }
  }

  Future<void> _getTrafficInfo() async {
    if (startLocationController.text.isEmpty ||
        destinationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both locations')),
      );
      return;
    }

    setState(() {
      isLoading = true;
      trafficInfo = null;
    });

    try {
      if (selectedStartLocation == null || selectedDestLocation == null) {
        throw Exception('Locations not properly selected');
      }

      final routeUrl = Uri.parse(
        'https://router.hereapi.com/v8/routes'
        '?transportMode=car'
        '&origin=${selectedStartLocation!.latitude},${selectedStartLocation!.longitude}'
        '&destination=${selectedDestLocation!.latitude},${selectedDestLocation!.longitude}'
        '&return=summary,polyline,actions,instructions'
        '&departureTime=any'
        '&spans=duration,length'
        '&apiKey=$apiKey'
      );

      final currentResponse = await http.get(routeUrl);
      
      final typicalRouteUrl = Uri.parse(
        'https://router.hereapi.com/v8/routes'
        '?transportMode=car'
        '&origin=${selectedStartLocation!.latitude},${selectedStartLocation!.longitude}'
        '&destination=${selectedDestLocation!.latitude},${selectedDestLocation!.longitude}'
        '&return=summary'
        '&traffic=disabled'
        '&apiKey=$apiKey'
      );
      
      final typicalResponse = await http.get(typicalRouteUrl);

      if (currentResponse.statusCode == 200 && typicalResponse.statusCode == 200) {
        final currentData = json.decode(currentResponse.body);
        final typicalData = json.decode(typicalResponse.body);

        if (currentData['routes']?.isNotEmpty && typicalData['routes']?.isNotEmpty) {
          final currentRoute = currentData['routes'][0]['sections'][0];
          final typicalRoute = typicalData['routes'][0]['sections'][0];

          final distance = (currentRoute['summary']['length'] / 1000).toStringAsFixed(2);
          final currentDuration = (currentRoute['summary']['duration'] / 60);
          final typicalDuration = (typicalRoute['summary']['duration'] / 60);
          
          final trafficDelay = currentDuration - typicalDuration;
          String trafficStatus;
          if (trafficDelay <= 1) {
            trafficStatus = 'No Traffic';
          } else if (trafficDelay <= 2) {
            trafficStatus = 'Light Traffic';
          } else if (trafficDelay <= 10) {
            trafficStatus = 'Moderate Traffic';
          } else {
            trafficStatus = 'Heavy Traffic';
          }

          setState(() {
            trafficInfo = '''
Route Information:
Distance: $distance km
Current Estimated Time: ${currentDuration.toStringAsFixed(0)} minutes
Typical Time: ${typicalDuration.toStringAsFixed(0)} minutes

Traffic Status: $trafficStatus

Note: Traffic data is based on current conditions.
''';
          });
        }
      } else {
        setState(() {
          trafficInfo = 'Error: Unable to get route information';
        });
      }
    } catch (e) {
      setState(() {
        trafficInfo = 'Error: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}