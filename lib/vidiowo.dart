import 'package:fitgen/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Vid extends StatelessWidget {
  const Vid({Key? key}) : super(key: key);

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
              image: AssetImage("lib/assets/download (3).jpeg"),
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
                  "Sport in the office",
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: theme.textColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "30 min",
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
