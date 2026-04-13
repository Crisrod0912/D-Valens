import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'create_categorias_widget.dart' show CreateCategoriasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCategoriasModel extends FlutterFlowModel<CreateCategoriasWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtNombreCat widget.
  FocusNode? txtNombreCatFocusNode;
  TextEditingController? txtNombreCatTextController;
  String? Function(BuildContext, String?)? txtNombreCatTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNombreCatFocusNode?.dispose();
    txtNombreCatTextController?.dispose();
  }
}
