// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_mobile/app/core/exceptions/user_exists_exceptions.dart';
import 'package:cuidapet_mobile/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile/app/repositories/user/user_repository.dart';
import 'package:cuidapet_mobile/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
  })  : _userRepository = userRepository,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    final firebaseAuth = FirebaseAuth.instance;
    final userMethod =
        await firebaseAuth.fetchSignInMethodsForEmail(email);

        if (userMethod.isNotEmpty) {
          throw UserExistsExceptions();
          
        }

        await _userRepository.register(email, password);
        final userRegisterCredential =  await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        await userRegisterCredential.user?.sendEmailVerification();
  }
}
