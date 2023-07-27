part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ModularState<_RegisterForm, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CuidapetTextFormField(
              label: 'Login',
              controller: _loginEC,
              validator: Validatorless.multiple([
                Validatorless.required('Login Obrigatorio'),
                Validatorless.email('login deve ser um e-mail válido'),
              ]),
            ),
            const SizedBox(height: 20),
            CuidapetTextFormField(
              label: 'Senha',
              obscuteText: true,
              controller: _passwordEC,
              validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatoria'),
                Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres'),
                Validatorless.compare(_passwordEC, 'Senha estão diferentes')
              ]),
            ),
            const SizedBox(height: 20),
            CuidapetTextFormField(
              label: 'Corfirmar senha',
              obscuteText: true,
              validator: Validatorless.multiple([Validatorless.required('É obrigatório confirmar a senha')]),
            ),
            const SizedBox(height: 20),
            CuidapetDefaultButton(
              onPressed: () {
                final formValid= _formKey.currentState?.validate() ?? false;
      
                if (formValid) {
                   controller.register(email: _loginEC.text, password: _passwordEC.text);
                  
                }
              },
              label: 'Cadastrar',
      
            ),
          ],
        ),
      ),
    );
  }
}
