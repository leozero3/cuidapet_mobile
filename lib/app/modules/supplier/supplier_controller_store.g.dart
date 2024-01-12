// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupplierControllerStore on SupplierControllerStoreBase, Store {
  late final _$_supplierModelAtom = Atom(
      name: 'SupplierControllerStoreBase._supplierModel', context: context);

  SupplierModel? get supplierModel {
    _$_supplierModelAtom.reportRead();
    return super._supplierModel;
  }

  @override
  SupplierModel? get _supplierModel => supplierModel;

  @override
  set _supplierModel(SupplierModel? value) {
    _$_supplierModelAtom.reportWrite(value, super._supplierModel, () {
      super._supplierModel = value;
    });
  }

  late final _$_supplierServicesAtom = Atom(
      name: 'SupplierControllerStoreBase._supplierServices', context: context);

  List<SupplierServicesModel> get supplierServices {
    _$_supplierServicesAtom.reportRead();
    return super._supplierServices;
  }

  @override
  List<SupplierServicesModel> get _supplierServices => supplierServices;

  @override
  set _supplierServices(List<SupplierServicesModel> value) {
    _$_supplierServicesAtom.reportWrite(value, super._supplierServices, () {
      super._supplierServices = value;
    });
  }

  late final _$_servicesSelectedAtom = Atom(
      name: 'SupplierControllerStoreBase._servicesSelected', context: context);

  ObservableList<SupplierServicesModel> get servicesSelected {
    _$_servicesSelectedAtom.reportRead();
    return super._servicesSelected;
  }

  @override
  ObservableList<SupplierServicesModel> get _servicesSelected =>
      servicesSelected;

  @override
  set _servicesSelected(ObservableList<SupplierServicesModel> value) {
    _$_servicesSelectedAtom.reportWrite(value, super._servicesSelected, () {
      super._servicesSelected = value;
    });
  }

  late final _$_findSupplierByIdAsyncAction = AsyncAction(
      'SupplierControllerStoreBase._findSupplierById',
      context: context);

  @override
  Future<void> _findSupplierById() {
    return _$_findSupplierByIdAsyncAction.run(() => super._findSupplierById());
  }

  late final _$_findSupplierServicesAsyncAction = AsyncAction(
      'SupplierControllerStoreBase._findSupplierServices',
      context: context);

  @override
  Future<void> _findSupplierServices() {
    return _$_findSupplierServicesAsyncAction
        .run(() => super._findSupplierServices());
  }

  late final _$SupplierControllerStoreBaseActionController =
      ActionController(name: 'SupplierControllerStoreBase', context: context);

  @override
  void addOrRemoveServices(SupplierServicesModel supplierServicesModel) {
    final _$actionInfo = _$SupplierControllerStoreBaseActionController
        .startAction(name: 'SupplierControllerStoreBase.addOrRemoveServices');
    try {
      return super.addOrRemoveServices(supplierServicesModel);
    } finally {
      _$SupplierControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
