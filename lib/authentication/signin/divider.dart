import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            color: Colors.black,
            height: 20,
          )),
          Text(
            'OR',
            style: GoogleFonts.marcellus(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.black,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
