import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupEmailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email_TextField widget.
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  String? _emailTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name your tour';
    }

    return null;
  }

  // State field(s) for Password_TextField1 widget.
  TextEditingController? passwordTextField1Controller;
  late bool passwordTextField1Visibility;
  String? Function(BuildContext, String?)?
      passwordTextField1ControllerValidator;
  String? _passwordTextField1ControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Password_TextField2 widget.
  TextEditingController? passwordTextField2Controller;
  late bool passwordTextField2Visibility;
  String? Function(BuildContext, String?)?
      passwordTextField2ControllerValidator;
  String? _passwordTextField2ControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name your tour';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailTextFieldControllerValidator = _emailTextFieldControllerValidator;
    passwordTextField1Visibility = false;
    passwordTextField1ControllerValidator =
        _passwordTextField1ControllerValidator;
    passwordTextField2Visibility = false;
    passwordTextField2ControllerValidator =
        _passwordTextField2ControllerValidator;
  }

  void dispose() {
    emailTextFieldController?.dispose();
    passwordTextField1Controller?.dispose();
    passwordTextField2Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
