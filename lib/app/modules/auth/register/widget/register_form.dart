part of '../register_page.dart';

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CuidapetTextformField(label: 'Login'),
          const SizedBox(height: 20),
          CuidapetTextformField(label: 'Senha', obscureText: true),
          const SizedBox(height: 20),
          CuidapetTextformField(label: 'Confirma Senha', obscureText: true),
          const SizedBox(height: 20),
          CuidapetDefaultButton(onPressed: () {}, label: 'Cadastrar')
        ],
      ),
    );
  }
}
