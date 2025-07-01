import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Toggle extends StatelessWidget {
  bool selected;
  String label;
  Toggle({super.key, required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 117,
      decoration: BoxDecoration(
        color: selected
            ? const Color.fromRGBO(173, 100, 11, 0.43)
            : const Color.fromRGBO(243, 202, 152, 0.43),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
