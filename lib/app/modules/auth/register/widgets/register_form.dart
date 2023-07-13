part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CuidapetTextFormField(label: 'Login'),
          const SizedBox(height: 20),
          CuidapetTextFormField(label: 'Senha', obscuteText: true,),
          const SizedBox(height: 20),
          CuidapetTextFormField(label: 'Corfirmar senha', obscuteText: true,),
          const SizedBox(height: 20),
          CuidapetDefaultButton(
            onPressed: () {},
            label: 'Cadastrar',
          ),
        ],
      ),
    );
  }
}
