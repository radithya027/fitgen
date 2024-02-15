
import 'package:fitgen/Card.dart';
import 'package:fitgen/Card1.dart';
import 'package:fitgen/Header.dart';
import 'package:fitgen/cardslider.dart';
import 'package:fitgen/vidiowo.dart';
import 'package:fitgen/vidiowo2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              THeaderHP(),
              SizedBox(
                height: 20,
              ),
              CardSlider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Video Workout",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              Vid(),
              SizedBox(height: 15),
              Vid2()
            ],
          ),
        ),
      ),
    );
  }
}
