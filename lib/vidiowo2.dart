import 'package:fitgen/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Vid2 extends StatelessWidget {
  const Vid2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          height: 120,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage("lib/assets/yogawo.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yoga at office",
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: theme.textColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "10 min",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: theme.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
