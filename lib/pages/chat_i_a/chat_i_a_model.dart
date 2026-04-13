import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'chat_i_a_widget.dart' show ChatIAWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatIAModel extends FlutterFlowModel<ChatIAWidget> {
  ///  Local state fields for this page.

  List<ChatStruct> chat = [];
  void addToChat(ChatStruct item) => chat.add(item);
  void removeFromChat(ChatStruct item) => chat.remove(item);
  void removeAtIndexFromChat(int index) => chat.removeAt(index);
  void insertAtIndexInChat(int index, ChatStruct item) =>
      chat.insert(index, item);
  void updateChatAtIndex(int index, Function(ChatStruct) updateFn) =>
      chat[index] = updateFn(chat[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for txtfMsjIA widget.
  FocusNode? txtfMsjIAFocusNode;
  TextEditingController? txtfMsjIATextController;
  String? Function(BuildContext, String?)? txtfMsjIATextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? respuesta;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtfMsjIAFocusNode?.dispose();
    txtfMsjIATextController?.dispose();
  }
}
