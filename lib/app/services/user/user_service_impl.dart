import 'package:cuidapet_mobile/app/core/exceptions/failure.dart';
import 'package:cuidapet_mobile/app/core/exceptions/user_exists_exceptions.dart';
import 'package:cuidapet_mobile/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet_mobile/app/core/helpers/constants.dart';
import 'package:cuidapet_mobile/app/core/local_storage/local_storage.dart';
import 'package:cuidapet_mobile/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile/app/models/Social_network_model.dart';
import 'package:cuidapet_mobile/app/models/social_login_type.dart';
import 'package:cuidapet_mobile/app/repositories/social/social_repository.dart';
import 'package:cuidapet_mobile/app/repositories/user/user_repository.dart';
import 'package:cuidapet_mobile/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final SocialRepository _socialRepository;

  UserServiceImpl(
      {required UserRepository userRepository,
      required AppLogger log,
      required LocalStorage localStorage,
      required LocalSecureStorage localSecureStorage,
      required SocialRepository socialRepository})
      : _userRepository = userRepository,
        _log = log,
        _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _socialRepository = socialRepository;

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
        await _confirmLogin();
        await _getUserData();
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
    _localStorage.write<String>(
        Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);
  }

  Future<void> _confirmLogin() async {
    final confirmLoginModel = await _userRepository.confirmLogin();
    await _seveAccessToken(confirmLoginModel.accessToken);
    await _localSecureStorage.write(Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
        confirmLoginModel.refreshToken);
  }

  Future<void> _getUserData() async {
    final userModel = await _userRepository.getUserLogged();
    await _localStorage.write<String>(
        Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY, userModel.toJson());
  }

  @override
  Future<void> SocialLogin(SocialLoginType socialLoginType) async {
    final SocialNetworkModel socialModel;
    final AuthCredential authCredential;
    final firebaseAuth = FirebaseAuth.instance;

    switch (socialLoginType) {
      case SocialLoginType.facebook:
        throw Failure(message: 'face nao implementado');
      // break;
      case SocialLoginType.google:
        socialModel = await _socialRepository.googleLogin();
        authCredential = GoogleAuthProvider.credential(
          accessToken: socialModel.accessToken,
          idToken: socialModel.id,
        );
        break;
    }
    final loginMethods =
        await firebaseAuth.fetchSignInMethodsForEmail(socialModel.email);
    final methodCheck = _getMethodToSocialLoginType(socialLoginType);

    if (loginMethods.isNotEmpty && !loginMethods.contains(methodCheck)) {
      throw Failure(
        message:
            'Login não pode ser feito por $methodCheck, utilize outro metodo',
      );
    }

    await firebaseAuth.signInWithCredential(authCredential);
  }

  String _getMethodToSocialLoginType(SocialLoginType socialLoginType) {
    switch (socialLoginType) {
      case SocialLoginType.facebook:
        return 'facebook.com';

      case SocialLoginType.google:
        return 'google.com';
    }
  }
}
