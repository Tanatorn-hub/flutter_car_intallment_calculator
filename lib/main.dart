import 'package:flutter/material.dart';
import 'package:flutter_car_intallment_calculator/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    FlutterCarIntallmentCalcultor(),
  );
}

// ---------------------------------------------------------------------
class FlutterCarIntallmentCalcultor extends StatefulWidget {
  const FlutterCarIntallmentCalcultor({super.key});

  @override
  State<FlutterCarIntallmentCalcultor> createState() =>
      _FlutterCarIntallmentCalcultorState();
}

class _FlutterCarIntallmentCalcultorState
    extends State<FlutterCarIntallmentCalcultor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
