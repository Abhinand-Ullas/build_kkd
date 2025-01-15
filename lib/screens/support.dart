import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_app_name/widgets/box.dart';

class SupportPage extends StatelessWidget {
  SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Support",
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 212, 246, 167)),
                height: 151,
                width: 357,
                child: MaterialButton(
                    onPressed: () async {
                      const phoneNumber =
                          'tel:9746438697'; // Replace with your phone number
                      final Uri uri = Uri.parse(phoneNumber);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      } else {
                        throw 'Could not launch $phoneNumber';
                      }
                    },
                    child: Center(
                        child: Text("Contact Police",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 26)))),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Services",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    Box(
                      title: "Hospital",
                      imagePath:
                          "assets/images/hospital.png", // Replace with your asset
                    ),
                    Box(
                      title: "Bank",
                      imagePath:
                          "assets/images/bank.png", // Replace with your asset
                    ),
                    Box(
                      title: "Government",
                      imagePath:
                          "assets/images/government.png", // Replace with your asset
                    ),
                    Box(
                      title: "Certificate",
                      imagePath:
                          "assets/images/certificate.png", // Replace with your asset
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
