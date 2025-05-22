import 'package:flutter/material.dart';

class ChatbotPage extends StatelessWidget {
  ChatbotPage({super.key});
  var messages = [
    {"type": "user", "message": "Hello"},
    {"type": "bot", "message": "Hi, how can I help you?"},
    {"type": "user", "message": "What is your name?"},
    {"type": "bot", "message": "I am a chatbot."},
    {"type": "user", "message": "What can you do?"},
    {"type": "bot", "message": "I can chat with you."},
  ];

  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chatbot DWM",
          style: TextStyle(color: Theme.of(context).indicatorColor),
        ),

        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${messages[index]['message']}"),
                  subtitle: Text("${messages[index]['type']}"),
                  leading: Icon(
                    messages[index]['type'] == 'user'
                        ? Icons.person
                        : Icons.chat,
                    color:
                        messages[index]['type'] == 'user'
                            ? Colors.blue
                            : Colors.green,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      suffixIcon: Icon(Icons.person),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
