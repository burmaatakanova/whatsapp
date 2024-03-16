import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("user name: ${data["userName"]}"),
          Text("user email"),
          Text("user phone"),
          Text("user data"),
        ],
      ),
    );
  }
}
