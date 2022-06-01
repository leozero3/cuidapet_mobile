import 'package:cuidapet_mobile/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store{

  @readonly
  UserModel? _userLogged;

  Future<void> loadUserLogged() async{
    _userLogged = UserModel.empty();

  }


}