import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_data_component_model.dart';
export 'empty_data_component_model.dart';

class EmptyDataComponentWidget extends StatefulWidget {
  const EmptyDataComponentWidget({super.key});

  @override
  State<EmptyDataComponentWidget> createState() =>
      _EmptyDataComponentWidgetState();
}

class _EmptyDataComponentWidgetState extends State<EmptyDataComponentWidget> {
  late EmptyDataComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyDataComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 100.0),
        child: Text(
          FFLocalizations.of(context).getText(
            '94l07cwi' /* No Data Available!! */,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Nunito Sans',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts: GoogleFonts.asMap().containsKey('Nunito Sans'),
              ),
        ),
      ),
    );
  }
}
