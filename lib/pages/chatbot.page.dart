import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
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
                return Column(
                  children: [
                    Row(
                      children: [
                        messages[index]['type'] == 'user'
                            ? SizedBox(width: 20)
                            : SizedBox(width: 0),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            color:
                                messages[index]['type'] == 'user'
                                    ? Colors.blue[50]
                                    : Colors.green[50],
                            child: ListTile(
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
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
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
                IconButton(
                  onPressed: () {
                    String question = usernameController.text;
                    String answer = "I don't know $question";
                    setState(() {
                      messages.add({"type": "user", "message": question});
                      messages.add({"type": "bot", "message": answer});
                    });
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
