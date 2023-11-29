import 'package:cuidapet_mobile/app/modules/auth/login/login_page.dart';
import 'package:cuidapet_mobile/app/modules/auth/login/widgets/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => LoginController(
            userService: i(),
            log: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const LoginPage(),
        ),
      ];
}
