import 'package:flutter/material.dart';

class UnderTextProposalButton extends StatelessWidget {
  final String text;
  final void Function(String)? onTap;

  const UnderTextProposalButton(this.text, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = Container(
      child: Text(
        text,
        textScaleFactor: 1.2,
        style: const TextStyle(color: Colors.black),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.purple[300],
      ),
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
    );

    return GestureDetector(
      onTap: (() => {
        if (onTap != null) onTap!(text)
      }),
      child: button,
    );
  }
}


class RegistrationTextFormField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String?>? onSaved;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool capitalize;

  const RegistrationTextFormField({
    Key? key,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.capitalize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        textCapitalization: capitalize ? TextCapitalization.words : TextCapitalization.none,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          fillColor: Colors.white,
          filled: true,
          labelText: hintText,
          errorStyle: const TextStyle(color: Colors.red),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        obscureText: obscureText,
        autocorrect: false,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
