import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final List<Map<String, String>> places = [
    {
      'name': 'Hilite Mall',
      'description':
          '''HiLITE Mall is the most exclusive shopping mall and entertainment center.
       Located in an area that is best known for its high-end stores and restaurants.''',
      'location': 'https://maps.app.goo.gl/jLWzrHbni2ty8yez7',
      'image': 'assets/images/HiLite.jpeg'
    },
    {
      'name': 'S-M-street',
      'description':
          '''This place is known as Mittai Theruvu or SM Street is one of the most popular and historic trade centers in calicut. 
      This is one of the most busiest streets''',
      'location': 'https://maps.app.goo.gl/AwMmPP9R5MSvAr4D8',
      'image': 'assets/images/sm-street.jpg'
    },
    {
      'name': 'Kozhikode beach',
      'description': '''Kozhikode Beach is a favourite haunt of sunset viewers.
                     It is also a prime location for seafood lovers as it provides a wide variety of delicacies''',
      'location': 'https://maps.app.goo.gl/F9evHcmLxq3YFnNx9',
      'image': 'assets/images/kozhikode_beach.jpg'
    },
    {
      'name': 'Kariyathumpara',
      'description':
          'Kariathumpara is a beautiful cool place, almost like a hill station',
      'location': 'https://maps.app.goo.gl/F9evHcmLxq3YFnNx9',
      'image': 'assets/images/kariyathumpara.jpg'
    },
  ];

  final List<Map<String, String>> foodSpots = [
    {
      'name': 'Paragon Restaurant',
      'description': 'Famous for traditional Malabar cuisine',
      'location': 'https://maps.app.goo.gl/rB2JsxJyEUznDQFQ6',
      'image': 'assets/images/paragon.jpg'
    },
    {
      'name': 'Rahamat hotel',
      'description':
          'Known for its famous beef biryani and traditional Kerala meals.',
      'location': 'https://maps.app.goo.gl/NzE2zDVjwiBJ8hkF7',
      'image': 'assets/images/hotel-rahamth.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.fromARGB(255, 232, 245, 233);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          "Let's Explore Kozhikode",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color.fromARGB(255, 132, 155, 102),
            height: 2.0,
          ),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Places to Visit',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromARGB(255, 212, 246, 167),
                      elevation: 1,
                      margin: EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => _showDetails(context, places[index]),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                places[index]['image']!,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(Icons.image, size: 50),
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                places[index]['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 14),
                Text(
                  'Food Spots',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 14),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: foodSpots.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromARGB(255, 212, 246, 167),
                      elevation: 1,
                      margin: EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => _showDetails(context, foodSpots[index]),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                foodSpots[index]['image']!,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(Icons.image, size: 50),
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                foodSpots[index]['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDetails(BuildContext context, Map<String, String> item) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item['image']!,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.image, size: 50),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(item['description']!),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final url = Uri.parse(item['location']!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      icon: Icon(Icons.location_on),
                      label: Text('View Location'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 45),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
