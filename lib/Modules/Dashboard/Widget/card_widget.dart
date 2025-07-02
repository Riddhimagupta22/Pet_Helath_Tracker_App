import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatefulWidget {
  final String image, title, subtitle;
  final VoidCallback? onTap;

  const CardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 375,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset(widget.image, height: 40, width: 35),
            const SizedBox(height: 1),
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                letterSpacing: -1,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(243, 120, 29, 1),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.subtitle,
              style: GoogleFonts.poppins(
                fontSize: 13,
                letterSpacing: -1,
                height: 1,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
