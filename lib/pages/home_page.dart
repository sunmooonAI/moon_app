import 'package:flutter/material.dart';

import '../widgets.dart';
import 'chat_page.dart';
import '../chuck_methods.dart';
import 'launch_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Chuck Norris'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/foreground.jpg',
            fit: BoxFit.fitHeight,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          const BottomBar(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              const SizedBox(
                height: 60.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: null,
                ),
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  // TODO log out from app
                  LaunchNavigator.goToLaunch(context);
                },
              )
            ],
          ).toList(),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> topics_widgets = topics
        .map((String topic) => UnderTextProposalButton(topic,
            onTap: (topic_name) => ChatNavigator.goToChat(context, topic_name: topic_name)))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
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
        ),
      ],
    );
  }
}

class TextInputField extends StatelessWidget {
  const TextInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: const Center(child: Text('Tap to write', style: TextStyle(color: Colors.grey))),
            margin: const EdgeInsets.only(left: 6),
            height: 20,
          ),
          // Container(
          //   margin: const EdgeInsets.all(5),
          //   child: const Icon(Icons.image, color: Colors.grey),
          // ),
        ],
      ),
      width: 1000,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 6),
    );

    return GestureDetector(
      onTap: () => ChatNavigator.goToChat(context),
      child: textField,
    );
  }
}

class HomeNavigator {
  static void goToHome(context, {String? topic_name}) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, anim1, anim2) => HomePage(),
      transitionsBuilder: (context, anim, a2, child) => FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 150),
    ));
  }
}
