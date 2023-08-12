import 'package:cuidapet_mobile/app/core/exceptions/failure.dart';
import 'package:cuidapet_mobile/app/core/exceptions/user_exists_exceptions.dart';
import 'package:cuidapet_mobile/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile/app/repositories/user/user_repository.dart';
import 'package:cuidapet_mobile/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
  final LocalStorage _localStorage;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
    required LocalStorage localStorage,
  })  : _userRepository = userRepository,
        _log = log,
        _localStorage = localStorage;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final userMethod = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethod.isNotEmpty) {
        throw UserExistsExceptions();
      }

      await _userRepository.register(email, password);
      final userRegisterCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _log.error('Erro ao criar usuario no Firebase', e, s);
      throw Failure(message: 'Erro ao criar usuario');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final loginMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.isEmpty) {
        throw UserNotExistsException();
      }
      if (loginMethods.contains('password')) {
        final userCredential = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        final userVerified = userCredential.user?.emailVerified ?? false;
        if (!userVerified) {
          userCredential.user?.sendEmailVerification();
          throw Failure(
              message:
                  'E-mail não confirmado, por favor verifique sua caixa de spam');
        }


        final accessToken = await _userRepository.login(email, password);
        await _seveAccessToken(accessToken);

      } else {
        throw Failure(
          message:
              'Login não pode ser feito por E-mail e senha, utilize outro metodo',
        );
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error('Usuario ou Senh inválidos, firebaseAuth[${e.code}]', e, s);
      throw Failure(message: 'Usuario ou Senh inválidos!!!');
    }
  }
  
  Future<void> _seveAccessToken(String accessToken) async {
    _localStorage.write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);
  }
}
