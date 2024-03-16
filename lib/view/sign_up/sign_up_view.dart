import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/user_models.dart';
import 'package:whatsapp/view/chats/chats_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final userNameConroller = TextEditingController();
  final emailConroller = TextEditingController();
  final passwordConroller = TextEditingController();
  final users = FirebaseFirestore.instance.collection("koldonuuchular");

  Future<void> signUp(BuildContext context) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailConroller.text,
        password: passwordConroller.text,
      );
      addUser(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  addUser(UserCredential userCredential) async {
    final UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        parol: passwordConroller.text,
        userName: userNameConroller.text,
        email: userNameConroller.text,
        timestamp: Timestamp.now());
    users.doc(userCredential.user!.uid).set(userModel.toMap()).then((value) {
      log("User added");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatsView(
                    data: userModel,
                  )));
    }).catchError((onError) => print("Failed to add"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: TextFormField(
              controller: userNameConroller,
              style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
              decoration: InputDecoration(
                  errorStyle: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: Colors.red),
                  labelText: "Enter User Name",
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
              signUp(context);
            },
            child: const Text(
              "Sign up",
              style: TextStyle(fontSize: 20),
            ))
      ],
    ));
  }
}
