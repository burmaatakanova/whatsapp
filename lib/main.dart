import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/firebase_options.dart';
import 'package:whatsapp/view/sign_in/sign_in_view.dart';
import 'package:whatsapp/view/sign_up/sign_up_view.dart';

void main() async {
// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignINView());
  }
}
