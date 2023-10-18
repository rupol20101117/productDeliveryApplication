import '/components/nagad_payment_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'nagad_confirmation_widget.dart' show NagadConfirmationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NagadConfirmationModel extends FlutterFlowModel<NagadConfirmationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for pin_number widget.
  TextEditingController? pinNumberController;
  String? Function(BuildContext, String?)? pinNumberControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    pinNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
