import 'package:dicoding_chatting/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatelessWidget {
  static const String id = 'chat_page';
  final _auth = FirebaseAuth.instance;

  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Logout',
            onPressed: () async {
              final navigator = Navigator.of(context);
              await _auth.signOut();
              
              navigator.pushReplacementNamed(LoginPage.id);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
              child: Placeholder(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {},
                  child: const Text('SEND'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
