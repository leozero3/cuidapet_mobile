import 'package:cuidapet_mobile/app/core/exceptions/user_exists_exceptions.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/messages.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet_mobile/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile/app/services/user/user_service.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;

  RegisterControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
  Loader.show();
  await _userService.register(email, password);
  Messages.info('Enviamos um email de confirmacao');
  Loader.hide();
} on UserExistsExceptions catch (e) {
  Loader.hide();
  Messages.alert('E-mail ja utilizado, por favor escolha outro');

}catch(e,s){

  _log.error('Erro ao registrar usuario', e,s);
  Loader.hide();
  Messages.alert('Erro ao registrar usuario');

}
  }
}
