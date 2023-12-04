import 'package:flutter/material.dart';
import 'package:ap/pallete.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final Function(String)? onTextChanged;
  final String? Function(String?)? validator;
  final bool isPassword;

  const LoginField({
    Key? key,
    required this.hintText,
    this.onTextChanged,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        obscureText: isPassword,
        onChanged: onTextChanged,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.borderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.gradient2,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
