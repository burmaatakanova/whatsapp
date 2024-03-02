import 'package:flutter/material.dart';
import 'package:whatsapp/view/sign_up/sign_up_view.dart';

void main() {
  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignUpView());
  }
}
