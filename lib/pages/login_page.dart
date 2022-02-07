import 'package:flutter/material.dart';

import 'home_page.dart';
import '../widgets.dart';
import '../utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0x00000000),
        // elevation: 0,
        title: const Text('Sign in'),
      ),
      body: const LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            RegistrationTextFormField(
              hintText: 'Email',
              onSaved: (String? str) => email = str ?? '',
              validator: (String? str) {
                if (str?.isEmpty ?? true) return 'Please enter Email';
                if (!emailValid(str!)) return 'Please enter valid Email';
                return null;
              },
            ),
            const SizedBox(height: 15.0),
            RegistrationTextFormField(
              hintText: 'Password',
              obscureText: true,
              onSaved: (String? str) => password = str ?? '',
              validator: (String? str) {
                if (str?.isEmpty ?? true) return 'Please enter Password';
                if (str!.length < 10) return 'Password is invalid';
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => onPressed(context),
              child: const Text('Continue'),
            )
          ],
        ),
      ),
    );
  }

  void onPressed(context) {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO check if password is valid
      HomeNavigator.goToHome(context);
    }
  }
}

class LogInNavigator {
  static void goToLogin(context, {String? topic_name}) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, anim1, anim2) => const LoginPage(),
      transitionsBuilder: (context, anim, a2, child) => FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 150),
    ));
  }
}