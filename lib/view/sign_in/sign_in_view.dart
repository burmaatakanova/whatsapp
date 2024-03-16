import 'dart:developer';


// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/user_models.dart';
import 'package:whatsapp/view/chats/chats_view.dart';
import 'package:whatsapp/view/sign_up/sign_up_view.dart';

class SignINView extends StatelessWidget {
  SignINView({Key? key}) : super(key: key);

  final passwordConroller = TextEditingController();
  final emailConroller = TextEditingController();
  Future<void> login(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailConroller.text,
        password: passwordConroller.text,
      );
    final userModel  =UserModel(userName: "", id: credential.user!.uid, email: emailConroller.text, parol: passwordConroller.text, timestamp: Timestamp.now());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ChatsView(data: userModel)));
      log("login credential-->$credential");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sign In",
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: TextFormField(
              controller: emailConroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter User Name";
                }
                return null;
              },
              style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
              decoration: InputDecoration(
                  errorStyle: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: Colors.red),
                  labelText: "Enter User Email",
                  labelStyle: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: TextFormField(
              controller: passwordConroller,
              // controller: _username,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter User Name";
                }
                return null;
              },
              style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
              decoration: InputDecoration(
                  errorStyle: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: Colors.red),
                  labelText: "Enter parol",
                  labelStyle: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              login(context);
            },
            child: const Text(
              "Sign up",
              style: TextStyle(fontSize: 20),
            ))
      ],
    ));
  }
}
