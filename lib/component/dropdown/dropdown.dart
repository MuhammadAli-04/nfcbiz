import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {super.key,
      required this.ticketCategories,
      required this.hintText,
      required this.onChanged});

  final List<String> ticketCategories;
  final String hintText;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        isExpanded: true,
        value: "",
        underline: Container(),
        onChanged: (String? newValue) {
          // setState(() {
          //   selectedCategory = newValue;
          // });
        },
        hint: Text(
          hintText,
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Nunito Sans',
                color: Colors.black54,
                useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
              ),
        ),
        items: ticketCategories
            .map((item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
            .toList());
  }
}
