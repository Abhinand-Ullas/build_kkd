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
      'image':
          'https://hilitemall.com/upload/store_sub_images/lOsvGv5ErAu3miqDun2zaLRwDDpc9nPzKGntJqNY.jpeg'
    },
    {
      'name': 'S-M-street',
      'description':
          '''This place is known as Mittai Theruvu or SM Street is one of the most popular and historic trade centers in calicut. 
      This is one of the most busiest streets''',
      'location': 'https://maps.app.goo.gl/AwMmPP9R5MSvAr4D8',
      'image':
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/72/96/b5/img-20180903-151209-largejpg.jpg?w=1200&h=-1&s=1'
    },
    {
      'name': 'Kozhikode beach',
      'description': '''Kozhikode Beach is a favourite haunt of sunset viewers.
                     It is also a prime location for seafood lovers as it provides a wide variety of delicacies''',
      'location': 'https://maps.app.goo.gl/F9evHcmLxq3YFnNx9',
      'image':
          'https://www.shutterstock.com/image-photo/colorful-beach-sunset-view-kozhikode-260nw-2106574919.jpg'
    },
    {
      'name': 'Kariyathumpara',
      'description':
          'Kariathumpara is a beautiful cool place, almost like a hill station',
      'location': 'https://maps.app.goo.gl/F9evHcmLxq3YFnNx9',
      'image':
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/75/92/24/kariyathumpara.jpg?w=1200&h=-1&s=1'
    },
    // Add more places here
  ];

  // Data for food spots
  final List<Map<String, String>> foodSpots = [
    {
      'name': 'Paragon Restaurant',
      'description': 'Famous for traditional Malabar cuisine',
      'location': 'https://maps.app.goo.gl/rB2JsxJyEUznDQFQ6',
      'image':
          'https://paragonrestaurant.in/wp-content/uploads/2023/06/paragon-about.jpg'
    },
    {
      'name': 'Rahmat hotel',
      'description':
          'Known for its famous beef biryani and traditional Kerala meals.',
      'location': 'https://maps.app.goo.gl/NzE2zDVjwiBJ8hkF7',
      'image':
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/7b/0a/51/hotel-rahamth.jpg?w=900&h=-1&s=1'
    },

    // Add more food spots here
  ];
// ... keep existing imports and data ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kerala Tourism Guide'),
      ),
      body: SingleChildScrollView(
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
                    margin: EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => _showDetails(context, places[index]),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            child: Image.network(
                              places[index]['image']!,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                height: 180,
                                color: Colors.grey[300],
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
              SizedBox(height: 24),
              Text(
                'Food Spots',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: foodSpots.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => _showDetails(context, foodSpots[index]),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            child: Image.network(
                              foodSpots[index]['image']!,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                height: 180,
                                color: Colors.grey[300],
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
    );
  }

  void _showDetails(BuildContext context, Map<String, String> item) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  item['image']!,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, size: 50),
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
