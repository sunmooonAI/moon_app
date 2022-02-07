import 'package:flutter/material.dart';
import '../widgets.dart';
import '../chuck_methods.dart';

class ChatPage extends StatelessWidget {
  final String? topic_name;

  const ChatPage({Key? key, this.topic_name = null}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.fitHeight,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Chat(),
          ],
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MessagesList(),
        BottomChatBar(),
      ],
    );
  }
}

class MessagesList extends StatefulWidget {
  const MessagesList({Key? key}) : super(key: key);

  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BottomChatBar extends StatelessWidget {
  const BottomChatBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> topics_widgets = topics.map((String topic) => UnderTextProposalButton(topic)).toList();

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: Color(0x44000000),
      ),
      constraints: const BoxConstraints(minHeight: 70, maxHeight: 100),
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          const TextInputField(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: topics_widgets),
          ),
        ],
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  const TextInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = Container(
      width: 1000,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 6),
    );

    return textField;
  }
}

class ChatNavigator {
  static void goToChat(context, {String? topic_name}) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, anim1, anim2) => ChatPage(topic_name: topic_name),
      transitionsBuilder: (context, anim, a2, child) => FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 150),
    ));
  }
}