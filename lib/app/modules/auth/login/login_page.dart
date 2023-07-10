import 'package:cuidapet_mobile/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CuidapetTextFormField(
                label: 'Login',
                controller: textController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Valor obrigatorio';
                  }
                  return null;
                },
              ),
              Text(textController.text),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState?.validate();
                  print(textController.text);
                },
                child: Text(textController.text),
              ),
              Icon(Cuidapet.facebook),
              Icon(Cuidapet.google),
            ],
          ),
        ),
      ),
    );
  }
}
