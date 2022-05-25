import 'package:cuidapet_mobile/app/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    // ChildRoute('/', child: (context, args) => const Home(),)
    ModuleRoute('/auth', module: AuthModule(),)

  ];
}
