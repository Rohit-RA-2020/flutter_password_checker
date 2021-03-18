import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'validator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TextEditingController textController = TextEditingController();

  AnimationController _controller;
  Animation<double> _fabScale;

  bool eightChars = false;
  bool specialChars = false;
  bool upperCase = false;
  bool number = false;

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      setState(() {
        eightChars = textController.text.length >= 8;
        number = textController.text.contains(RegExp(r'\d'), 0);
        upperCase = textController.text.contains(new RegExp(r'[A-Z]'), 0);
        specialChars = textController.text.isNotEmpty &&
            !textController.text.contains(RegExp(r'^[\w&.-]+$'), 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            "Check your Password here",
            style: GoogleFonts.gloriaHallelujah(
              fontSize: 30,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: textController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
