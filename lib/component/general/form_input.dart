import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  TextEditingController controller;
  String label;
  String? placeholder;
  Icon? prefixIcon;
  Icon? suffixIcon;
  String? errorMessage;
  bool obscureText;

  FormInput({
    required this.controller,
    required this.label,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.errorMessage,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
          validator: (value) {
            if (value!.isEmpty) {
              return errorMessage ?? 'Field $label is required';
            }

            return null;
          },
        ),
      ],
    );
  }
}
