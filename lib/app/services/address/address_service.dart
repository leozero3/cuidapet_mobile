import 'package:cuidapet_mobile/app/entities/address_entity.dart';
import 'package:cuidapet_mobile/app/models/place_model.dart';

abstract class AddressService {
  Future<List<PlaceModel>> findAddressByGooglePlaces(String addressPattern);
  Future<List<AddressEntity>> getAddress();
  Future<void> deleteAll();
  Future<AddressEntity> saveAddress(PlaceModel place, String additional);

  Future<void> selectAddress(AddressEntity addressEntity);
  Future<AddressEntity?> getAddressSelected();
}
