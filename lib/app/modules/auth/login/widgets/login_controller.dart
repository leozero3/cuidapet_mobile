// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_mobile/app/core/ui/widgets/loader.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet_mobile/app/services/user/user_service.dart';

import '../../../../core/logger/app_logger.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;

  LoginControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> login(String login, String password) async {
    Loader.show();
    print(login);
    print(password);
    await Future.delayed(const Duration(seconds: 2));
    Loader.hide();
  }
}
