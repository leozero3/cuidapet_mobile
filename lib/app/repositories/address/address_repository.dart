import 'package:cuidapet_mobile/app/models/place_model.dart';

abstract class AddressRepository {
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
}
