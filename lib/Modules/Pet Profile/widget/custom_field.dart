import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatefulWidget {
  String label;
  TextEditingController controller;
   CustomField({super.key,required this.controller,required this.label});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(253
            , 240, 220, 1),

      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
             color:  Color.fromRGBO(79, 45, 39, 1)
          )
        ),

      ),
    );
  }
}
