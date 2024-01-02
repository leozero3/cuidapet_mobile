import 'package:cuidapet_mobile/app/core/life_cycle/controller_life_cycle.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/loader.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/messages.dart';
import 'package:cuidapet_mobile/app/entities/address_entity.dart';
import 'package:cuidapet_mobile/app/models/supplier_category_model.dart';
import 'package:cuidapet_mobile/app/models/supplier_nearby_me_model.dart';
import 'package:cuidapet_mobile/app/services/address/address_service.dart';
import 'package:cuidapet_mobile/app/services/supplier/supplier_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

enum SupplierPageType { list, grid }

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  final AddressService _addressService;
  final SupplierService _supplierService;

  @readonly
  AddressEntity? _addressEntity;

  @readonly
  var _listCategories = <SupplierCategoryModel>[];

  @readonly
  var _supplierPageTypeSelected = SupplierPageType.list;

  @readonly
  var _listSuppliersByAddress = <SupplierNearbyMeModel>[];

  var _listSuppliersByAddressCache = <SupplierNearbyMeModel>[];

  @readonly
  SupplierCategoryModel? _supplierCategoryFilterSelected;

  late ReactionDisposer findSuppliersReactionDisposer;

  HomeControllerBase({
    required AddressService addressService,
    required SupplierService supplierService,
  })  : _addressService = addressService,
        _supplierService = supplierService;

  @override
  void onInit([Map<String, dynamic>? params]) {
    findSuppliersReactionDisposer = reaction((_) => _addressEntity, (address) {
      findSupplierByAdrress();
    });
  }

  @override
  Future<void> onReady() async {
    try {
      Loader.show();

      // 1 - identificar se o usuario tem algum endereço selecionado
      // 2 - se tiver um endereco, recuperar ele!
      await _getAddressSelected();
      await _getCategories();
    } finally {
      Loader.hide();
    }
  }

  @override
  void dispose() {
    findSuppliersReactionDisposer();
  }

  @action
  Future<void> _getAddressSelected() async {
    _addressEntity ??= await _addressService.getAddressSelected();
    if (_addressEntity == null) {
      goToAddressPage();
    }
  }

  @action
  Future<void> goToAddressPage() async {
    final address = await Modular.to.pushNamed<AddressEntity>('/address/');
    if (address != null) {
      _addressEntity = address;
    }
  }

  @action
  Future<void> _getCategories() async {
    try {
      final categories = await _supplierService.getCategories();
      _listCategories = [...categories];
    } catch (e) {
      Messages.alert('Erro ao buscar as categorias');
      throw Exception(
        'error_message',
      );
    }
  }

  @action
  void changeTabSupplier(SupplierPageType supplierPageType) {
    _supplierPageTypeSelected = supplierPageType;
  }

  @action
  Future<void> findSupplierByAdrress() async {
    if (_addressEntity != null) {
      final suppliers = await _supplierService.findNearBy(_addressEntity!);
      _listSuppliersByAddress = [...suppliers];
      _listSuppliersByAddressCache = [...suppliers];
      filterSupplier();
    } else {
      Messages.alert(
          'Pare realizar a busca de petshops você precisa selecione um endereço');
    }
  }

  @action
  void filterSupplierCategory(SupplierCategoryModel category) {
    if (_supplierCategoryFilterSelected == category) {
      _supplierCategoryFilterSelected = null;
    } else {
      _supplierCategoryFilterSelected = category;
    }
    filterSupplier();
  }

  @action
  void filterSupplier() {
    var suppliers = [..._listSuppliersByAddressCache];
    if (_supplierCategoryFilterSelected != null) {
      suppliers = suppliers
          .where((supplier) =>
              supplier.category == _supplierCategoryFilterSelected?.id)
          .toList();
    }
    _listSuppliersByAddress = [...suppliers];
  }
}
