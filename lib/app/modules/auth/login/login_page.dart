import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:flutter/material.dart';
//login_page

class LoginPage extends StatelessWidget {
  final testeEC = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CuidapetTextformField(
              label: 'Login',
              obscureText: true,
              controller: testeEC,
            ),
            Text(testeEC.text)
          ],
        ),
      ),
    );
  }
}
