// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

import 'package:cuidapet_mobile/app/models/place_model.dart';

class AddressDetailPage extends StatefulWidget {
  final PlaceModel place;

  const AddressDetailPage({
    super.key,
    required this.place,
  });

  @override
  _AddressDetailPageState createState() => _AddressDetailPageState();
}

class _AddressDetailPageState extends State<AddressDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: context.primaryColor),
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(
            'Confirme seu endereço',
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
