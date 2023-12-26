import 'package:cuidapet_mobile/app/core/life_cycle/page_life_cycle_state.dart';
import 'package:cuidapet_mobile/app/entities/address_entity.dart';
import 'package:cuidapet_mobile/app/modules/home/home_controller.dart';
import 'package:cuidapet_mobile/app/modules/home/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
part 'widgets/home_address_widget.dart';

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
        drawer: Drawer(
          backgroundColor: Colors.grey[100],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              HomeAppBar(controller),
              SliverToBoxAdapter(
                child: _HomeAddressWidget(
                  controller: controller,
                ),
              )
            ];
          },
          body: Container(),
        ));
  }
}
