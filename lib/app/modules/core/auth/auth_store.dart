import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/services/address/address_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet_mobile/app/models/user_model.dart';

import '../../../core/local_storage/local_storage.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final AddressService _addressService;

  @readonly //esse atributo faz com que atributos privados sejam criados automaticamente um metodo gets dele
  UserModel? _userLogged;
  AuthStoreBase({
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStorage,
    required AddressService addressService,
  })  : _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _addressService = addressService;

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
    await _localSecureStorage.clear();
    await _addressService.deleteAll();
    _userLogged = UserModel.empty();
  }
}
