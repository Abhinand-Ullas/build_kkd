import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            SizedBox(
              height: 10,
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
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40)))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
