import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CashInOut extends StatelessWidget {
  final String title;

  CashInOut(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

