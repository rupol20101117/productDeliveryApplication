import '/components/rocket_payment_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'rocket_pay_widget.dart' show RocketPayWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RocketPayModel extends FlutterFlowModel<RocketPayWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for rocket_pin_number widget.
  TextEditingController? rocketPinNumberController;
  String? Function(BuildContext, String?)? rocketPinNumberControllerValidator;
  // State field(s) for rocket_account_number widget.
  TextEditingController? rocketAccountNumberController;
  String? Function(BuildContext, String?)?
      rocketAccountNumberControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    rocketPinNumberController?.dispose();
    rocketAccountNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
