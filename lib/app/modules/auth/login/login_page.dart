import 'package:cuidapet_mobile/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_text_form_field.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/rounded_button_with_icon.dart';
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
              RoundedButtonWithIcon(
                onTap: () {},
                width: 200,
                color: Colors.blue,
                icon: Cuidapet.facebook,
                label: 'Facebook',
              ),
              RoundedButtonWithIcon(
                onTap: () {},
                width: 200,
                color: Colors.orange,
                icon: Cuidapet.facebook,
                label: 'Google',
              ),
              CuidapetDefaultButton(
                onPressed: () {},
                borderRadius: 10,
                label: 'Entrar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
