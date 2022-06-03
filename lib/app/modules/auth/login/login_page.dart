import 'package:cuidapet_mobile/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:flutter/material.dart';
//login_page

class LoginPage extends StatelessWidget {
  final testeEC = TextEditingController();
  final formkey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              CuidapetTextformField(
                label: 'Login',
                obscureText: true,
                controller: testeEC,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Valor Obrigatorio';
                  }
                  return null;
                },
              ),
              Text(testeEC.text),
              ElevatedButton(
                onPressed: () {
                  formkey.currentState?.validate();
                  Text(testeEC.text);
                },
                child: Text('Validar'),
              ),
              Icon(Cuidapet.facebook),
              Icon(Cuidapet.google)
            ],
          ),
        ),
      ),
    );
  }
}
