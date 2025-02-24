
import 'dart:convert';

import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static const String tag = '/SplashScreen2';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Walkthrough> walkList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // Simulate fetching walkthrough data
    final String walkthroughData = '[]'; // Replace with actual data source
    Iterable menu = jsonDecode(walkthroughData);
    walkList = menu.map((model) => Walkthrough.fromJson(model)).toList();

    // Delay and navigate to dashboard
    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey
            ],
          ),
        ),


        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/ic_logo.png'), // Replace with your app icon path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Shree Samrajyalakshmi\nMaha Samsthanam',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffa32d3b),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Walkthrough {
  final String title;
  final String description;

  Walkthrough({required this.title, required this.description});

  factory Walkthrough.fromJson(Map<String, dynamic> json) {
    return Walkthrough(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
