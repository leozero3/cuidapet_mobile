import 'package:cuidapet_mobile/app/core/life_cycle/controller_life_cycle.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  @override
  void onInit([Map<String, dynamic>? params]) {
    // ignore: avoid_print
    print('OnInit chamado');
  }

  @override
  Future<void> onReady() async {
    await _hasRegisteredAddress();
  }
}

Future<void> _hasRegisteredAddress() async => null;
