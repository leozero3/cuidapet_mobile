import 'package:cuidapet_mobile/app/modules/address/address_controller.dart';
import 'package:cuidapet_mobile/app/modules/address/address_detail/address_detail_module.dart';
import 'package:cuidapet_mobile/app/modules/address/address_page.dart';
import 'package:cuidapet_mobile/app/modules/address/widgets/address_search_widget/address_search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddressModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => AddressSearchController(
            addressService: i(),
          ),
        ),
        Bind.lazySingleton((i) => AddressController(addressService: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const AddressPage()),
        ModuleRoute('/detail', module: AddressDetailModule()),
      ];
}
