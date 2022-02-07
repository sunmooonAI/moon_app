import 'package:flutter/material.dart';

import 'home_page.dart';
import '../widgets.dart';
import '../utils.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0x00000000),
        // elevation: 0,
        title: const Text('Create an account'),
      ),
      body: const Registration(),
    );
  }
}

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String firstName = "";
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
              hintText: 'First name',
              capitalize: true,
              onSaved: (String? str) => firstName = str ?? '',
              validator: (String? str) {
                if (str?.isEmpty ?? true) return 'Please enter First name';
                return null;
              },
            ),
            const SizedBox(height: 15.0),
            RegistrationTextFormField(
              hintText: 'Email',
              onSaved: (String? str) => email = str ?? '',
              validator: (String? str) {
                if (str?.isEmpty ?? true) return 'Please enter Email';
                if (!emailValid(str!)) return 'Please enter valid Email';
                // TODO check if email is in database
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
                if (str!.length < 10) return 'Password must be at least 10 symbols';
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
      // TODO send request to register user
      HomeNavigator.goToHome(context);
    }
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

class RegisterNavigator {
  static void goToRegister(context, {String? topic_name}) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, anim1, anim2) => const RegisterPage(),
      transitionsBuilder: (context, anim, a2, child) => FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 150),
    ));
  }
}