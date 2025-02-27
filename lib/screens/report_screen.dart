import 'package:Calicut_compass/screens/complaints_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:your_app_name/screens/complaints_screen.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report an Issue', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFFE8F5E9),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color.fromARGB(255, 132, 155, 102),
            height: 2.0,
          ),
        ),  
      ),
      body: ComplaintsPage(),
    );
  }
}
