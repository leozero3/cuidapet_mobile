import 'package:flutter_modular/flutter_modular.dart';

mixin ControllerLifeCycle implements Disposable {
  void onInit([Map<String, dynamic>? params]) {
    //envia parametros para controller dentro do ciclo de vida
  }

  void onReady() {}

  @override
  void dispose() {}
}
