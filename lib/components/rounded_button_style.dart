import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButtonStyle extends StatelessWidget {
  final String title;
  const RoundedButtonStyle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1.5, color: Colors.white)),
      child: Text(
        title,
        style: GoogleFonts.aclonica(
          color: Colors.black,
          // fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
