import 'package:cuidapet_mobile/app/models/Social_network_model.dart';

abstract class SocialRepository {
  Future<SocialNetworkModel> googleLogin();
  Future<SocialNetworkModel> facebookLogin();
}
