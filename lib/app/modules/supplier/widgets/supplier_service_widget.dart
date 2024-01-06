import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class SupplierServiceWidget extends StatelessWidget {
  const SupplierServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: context.primaryColorLight,
        child: Icon(
          Icons.pets,
        ),
      ),
      title: Text('asd'),
      subtitle: Text(r'R$ sdfdsfs'),
      trailing: Icon(
        Icons.add_circle,
        size: 30,
        color: context.primaryColor,
      ),
    );
  }
}
