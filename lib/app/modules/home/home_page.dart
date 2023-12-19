import 'package:cuidapet_mobile/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:cuidapet_mobile/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile/app/entities/address_entity.dart';
import 'package:cuidapet_mobile/app/modules/home/home_controller.dart';
import 'package:cuidapet_mobile/app/services/address/address_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageLifeCycleState<HomeController, HomePage> {
  AddressEntity? addressEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Logout')),
          TextButton(
              onPressed: () async {
                final categoriesResponse =
                    await Modular.get<RestClient>().auth().get('/categories/');
                print(categoriesResponse.data);
              },
              child: const Text('Teste refresh token')),
          TextButton(
              onPressed: () async {
                await Modular.to.pushNamed('/address/');
              },
              child: const Text('Ir para Endereço')),
          TextButton(
              onPressed: () async {
                final address =
                    await Modular.get<AddressService>().getAddressSelected();
                setState(() {
                  addressEntity = address;
                });
              },
              child: const Text('Buscar endereco')),
          Text(addressEntity?.address ?? 'Nenhum endereco selecionado'),
          Text(addressEntity?.additional ?? 'Nenhum complemento selecionado')
        ],
      ),
    );
  }
}
