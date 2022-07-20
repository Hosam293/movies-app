import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  TextEditingController? titleController;

  String? title;
  Widget? suffixIcon;
  Widget? prefixIcon;
  FormFieldValidator<String>? validator;
  TextInputType? type;
  GestureTapCallback? onTap;
  bool obscureText;

  CustomFormField(
      {Key? key, this.titleController,
      this.title,
      this.suffixIcon,
      this.prefixIcon,
      this.validator,
      this.type,
      this.onTap,
      this.obscureText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: title,
        labelStyle: const TextStyle(
          color: Colors.teal,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        // prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.amberAccent),

        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.teal),
        ),
      ),
      validator: validator,
      cursorColor: Colors.teal,
      maxLines: 1,
      controller: titleController,
      keyboardType: type,
      obscureText: obscureText,
    );
  }
}
