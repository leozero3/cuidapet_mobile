import 'package:cuidapet_mobile/app/core/helpers/text_formater.dart';
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extensions.dart';
import 'package:cuidapet_mobile/app/models/supplier_services_model.dart';
import 'package:flutter/material.dart';

class SupplierServiceWidget extends StatelessWidget {
  final SupplierServicesModel service;
  const SupplierServiceWidget({super.key, required this.service});

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
      trailing: Icon(
        Icons.add_circle,
        size: 30,
        color: context.primaryColor,
      ),
    );
  }
}
