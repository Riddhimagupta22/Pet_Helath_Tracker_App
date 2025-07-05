import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatefulWidget {
  String label;
  TextEditingController controller;
  final TextInputType keyboardType;
  int? maxLines;
  CustomField(
      {super.key,
      required this.controller,
      required this.label,
      required this.keyboardType,
      this.maxLines});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(253, 240, 220, 1),
      ),
      child: TextField(
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.label,
            hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(79, 45, 39, 1))),
      ),
    );
  }
}
