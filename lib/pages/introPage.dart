import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 20, top: 60),
              child: Image(
                width: double.infinity,
                image: AssetImage('assets/images/intro.png'),
              ),
            ),
            Spacer(),
            Text(
              'we deliver groceries at your home',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              'Fresh items every day',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            ),
            SizedBox(height: 28),
            Spacer(),
            GestureDetector(
              dragStartBehavior: DragStartBehavior.start,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Get Started ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
