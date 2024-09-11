import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class StatusButton extends StatelessWidget {
  const StatusButton({super.key, required this.ticketStatus, this.closedAt});

  final int ticketStatus;
  final String? closedAt;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        elevation: 5.0,
        fixedSize: const Size(85.0, 20.0),
        backgroundColor: ticketStatus == 1
            ? closedAt != null && closedAt!.isNotEmpty
                ? Colors.grey
                : Colors.green
            : Colors.orange,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          ticketStatus == 1
              ? closedAt != null && closedAt!.isNotEmpty
                  ? "CLOSED"
                  : "OPEN"
              : "IN PROGRESS",
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Nunito Sans',
                color: Colors.white,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
              ),
        ),
      ),
    );
  }
}
