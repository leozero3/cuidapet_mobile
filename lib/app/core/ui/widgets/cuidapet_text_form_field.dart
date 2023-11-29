import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class CuidapetTextFormField extends StatelessWidget {
  CuidapetTextFormField(
      {Key? key,
      required this.label,
      this.obscureText = false,
      this.controller,
      this.validator})
      : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, __) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextVNValue,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVN.value = !obscureTextVNValue;
                    },
                    icon: Icon(
                      obscureTextVNValue ? Icons.lock : Icons.lock_open,
                      color: context.primaryColor,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
