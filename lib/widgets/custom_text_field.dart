import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({
    super.key,
    this.hintText,
    this.onChange,
    this.obscure = false,
  });

  Function(String)? onChange;
  String? hintText;
  bool? obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'This field is required';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
