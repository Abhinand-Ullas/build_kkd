import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_app_name/widgets/box.dart';

class SupportPage extends StatelessWidget {
  SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color(0xFFE8F5E9);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Support",
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
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
        child: SafeArea(
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
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                        onPressed: () async {
                          const phoneNumber = 'tel:9746438697';
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
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26)))),
                  ),
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
                height: screenHeight * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    children: [
                      Box(
                        title: "Hospital",
                        imagePath: "assets/images/hospital.png",
                        address:
                            "https://kozhikode.nic.in/en/public-utility-category/hospitals/",
                      ),
                      Box(
                        title: "Bank",
                        imagePath: "assets/images/bank.png",
                        address:
                            "https://kozhikode.nic.in/en/public-utility-category/banks/",
                      ),
                      Box(
                        title: "Municipalities",
                        imagePath: "assets/images/government.png",
                        address:
                            "https://kozhikode.nic.in/en/public-utility-category/municipality/",
                      ),
                      Box(
                        title: "Documents",
                        imagePath: "assets/images/certificate.png",
                        address:
                            "https://kozhikode.nic.in/en/service-category/certificates/",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
