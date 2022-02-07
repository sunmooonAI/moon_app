import 'package:flutter/material.dart';

import 'register_page.dart';
import 'login_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => LogInNavigator.goToLogin(context),
                child: const SizedBox(
                  width: 100,
                  child: Center(child: Text('Log In')),
                ),
              ),
              ElevatedButton(
                onPressed: () => RegisterNavigator.goToRegister(context),
                child: const SizedBox(
                  width: 100,
                  child: Center(child: Text('Register')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class LaunchNavigator {
  static void goToLaunch(context, {String? topic_name}) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, anim1, anim2) => const LaunchPage(),
      transitionsBuilder: (context, anim, a2, child) => FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 150),
    ));
  }
}