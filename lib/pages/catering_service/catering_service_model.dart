import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'catering_service_widget.dart' show CateringServiceWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CateringServiceModel extends FlutterFlowModel<CateringServiceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TxtNum widget.
  FocusNode? txtNumFocusNode;
  TextEditingController? txtNumTextController;
  String? Function(BuildContext, String?)? txtNumTextControllerValidator;
  // State field(s) for TxtName widget.
  FocusNode? txtNameFocusNode;
  TextEditingController? txtNameTextController;
  String? Function(BuildContext, String?)? txtNameTextControllerValidator;
  // State field(s) for TxtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for TxtCantPer widget.
  FocusNode? txtCantPerFocusNode;
  TextEditingController? txtCantPerTextController;
  String? Function(BuildContext, String?)? txtCantPerTextControllerValidator;
  // State field(s) for TxtPlatillo widget.
  String? txtPlatilloValue;
  FormFieldController<String>? txtPlatilloValueController;
  // State field(s) for TxtDireccion widget.
  FocusNode? txtDireccionFocusNode;
  TextEditingController? txtDireccionTextController;
  String? Function(BuildContext, String?)? txtDireccionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNumFocusNode?.dispose();
    txtNumTextController?.dispose();

    txtNameFocusNode?.dispose();
    txtNameTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtCantPerFocusNode?.dispose();
    txtCantPerTextController?.dispose();

    txtDireccionFocusNode?.dispose();
    txtDireccionTextController?.dispose();
  }
}
