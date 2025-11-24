import 'package:flutter/material.dart' ;
import 'package:fruits_hub_app/core/widgets/custom_form_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return CustomFormTextField(
      controller: widget.passwordController,
      obscureText: isVisible,
      hintText: 'password',
      suffixIcon: GestureDetector(
        onTap: () {
          isVisible = !isVisible;
          setState(() {});
        },
        child: isVisible
            ? Icon(Icons.visibility_off)
            : Icon(Icons.remove_red_eye),
      ),
    );
  }
}
