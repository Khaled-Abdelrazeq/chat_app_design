import 'package:flutter/material.dart';

import 'ChatMessages.dart';

class MyChatScreen extends StatefulWidget {
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  TextEditingController _controller;
  List<ChatMessages> _messages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _messages = <ChatMessages>[];
  }

  void _onSubmit(String txt) {
    setState(() {
      _messages.insert(
          0,
          ChatMessages(
            text: txt,
          ));
    });
    _controller.clear();
  }

  Widget _sendText() {
    return IconTheme(
        data: IconThemeData(color: Colors.blue),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: "Send a message..."),
                  controller: _controller,
                  onSubmitted: _onSubmit,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Icon(
                    Icons.send,
                  ),
                  onTap: () => _onSubmit(_controller.text),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat app"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0,),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _sendText(),
            ),

          ],
        ));
  }
}
