part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  _LoginRegisterButtons({Key? key}) : super(key: key);

  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      children: [
        RoundedButtonWithIcon(
          onTap: () {},
          width: .42.sw,
          color: const Color(0xff4267b3),
          icon: Cuidapet.facebook,
          label: 'Facebook',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            controller.socialLogin(SocialLoginType.google);
          },
          width: .42.sw,
          color: const Color(0xffe15031),
          icon: Cuidapet.google,
          label: 'Google',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            Navigator.pushNamed(context, '/auth/register/');
          },
          width: .42.sw,
          color: context.primaryColorDark,
          icon: Icons.mail,
          label: 'Cadastre-se',
        ),
      ],
    );
  }
}
