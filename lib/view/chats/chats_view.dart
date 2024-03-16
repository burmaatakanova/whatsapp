import 'package:flutter/material.dart';
import 'package:whatsapp/models/user_models.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key, required this.data}) : super(key: key);
  final UserModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("user name: ${data[""]}"),
          const Text("user email"),
          const Text("user phone"),
          const Text("user data"),
        ],
      ),
    );
  }
}
