import 'package:cuidapet_mobile/app/home.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    // ChildRoute('/', child: (context, args) => const Home(),)
    ChildRoute('/', child: (context, args) => const Home(),)

  ];
}
