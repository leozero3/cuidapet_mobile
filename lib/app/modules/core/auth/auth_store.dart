import 'package:cuidapet_mobile/app/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {

  @readonly //esse atributo faz com que atributos privados sejam criados automaticamente um metodo gets dele
  UserModel? _userLogged;

  @action
  Future<void> loadUserLogged()async {
    _userLogged = UserModel.empty();
  }

}
