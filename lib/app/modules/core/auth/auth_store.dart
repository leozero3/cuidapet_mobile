// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet_mobile/app/models/user_model.dart';

import '../../../core/local_storage/local_storage.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LocalStorage _localStorage;

  @readonly //esse atributo faz com que atributos privados sejam criados automaticamente um metodo gets dele
  UserModel? _userLogged;
  AuthStoreBase({
    required LocalStorage localStorage,
    // this._userLogged,
  }) : _localStorage = localStorage;

  @action
  Future<void> loadUserLogged() async {
    //usuario logado
    final userModelJson = await _localStorage
        .read<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY);

    if (userModelJson != null) {
      _userLogged = UserModel.fromJson(userModelJson);
    } else {
      _userLogged = UserModel.empty();
    }

    //usuario deslogado

    FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        logout();
      }
    });
  }

  @action
  Future<void> logout() async {
    await _localStorage.clear();
    _userLogged = UserModel.empty();
  }
}
