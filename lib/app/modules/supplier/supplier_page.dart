import 'package:cuidapet_mobile/app/core/ui/extensions/theme_extensions.dart';
import 'package:cuidapet_mobile/app/modules/supplier/widgets/supplier_detail.dart';
import 'package:cuidapet_mobile/app/modules/supplier/widgets/supplier_service_widget.dart';
import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({Key? key}) : super(key: key);

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  late ScrollController _scrollController;
  bool sliverCollapsed = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 180 &&
          !_scrollController.position.outOfRange) {
        setState(() {
          sliverCollapsed = true;
        });
      } else if (_scrollController.offset <= 180 &&
          !_scrollController.position.outOfRange) {
        setState(() {
          sliverCollapsed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Fazer agendamento'),
        icon: const Icon(Icons.schedule),
        backgroundColor: context.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            title: Visibility(
              visible: sliverCollapsed,
              child: Text('Clinica sjihdfijashf'),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network(
                'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png,',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SupplierDetail(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Serviços (0) Selecionados',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SupplierServiceWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
