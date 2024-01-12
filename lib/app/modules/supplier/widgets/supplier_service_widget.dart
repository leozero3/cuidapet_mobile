import 'package:flutter/material.dart';

import 'package:cuidapet_mobile/app/core/helpers/text_formater.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extensions.dart';
import 'package:cuidapet_mobile/app/models/supplier_services_model.dart';
import 'package:cuidapet_mobile/app/modules/supplier/supplier_controller_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SupplierServiceWidget extends StatelessWidget {
  final SupplierServicesModel service;
  final SupplierControllerStore supplierController;
  const SupplierServiceWidget({
    Key? key,
    required this.service,
    required this.supplierController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: context.primaryColorLight,
        child: Icon(
          Icons.pets,
        ),
      ),
      title: Text(service.name),
      subtitle: Text(TextFormater.formatReal(service.price)),
      trailing: Observer(builder: (_) {
        return IconButton(
          icon: supplierController.isServiceSelected(service)
              ? const Icon(
                  Icons.remove_circle,
                  size: 30,
                  color: Colors.red,
                )
              : Icon(
                  Icons.add_circle,
                  size: 30,
                  color: context.primaryColor,
                ),
          onPressed: () {
            supplierController.addOrRemoveServices(service);
          },
        );
      }),
    );
  }
}
