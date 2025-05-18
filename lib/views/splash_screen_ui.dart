import 'package:flutter/material.dart';
import 'package:flutter_car_intallment_calculator/views/input_screen_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // Delay หน้าจอ
    Future.delayed(
      // ระยะเวลา
      Duration(seconds: 3),
      // ครบเวลาแล้วทำอะไรต่อ...
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => InputScreenUI(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img01.png',
              width: 280,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Car Installment',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen[100],
              ),
            ),
            Text(
              'Calculator',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen[100],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Created by tanatorn DTI-SAU',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen[100],
              ),
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
