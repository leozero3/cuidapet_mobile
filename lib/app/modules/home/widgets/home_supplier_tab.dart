// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_page.dart';

class HomeSupplierTab extends StatelessWidget {
  final HomeController homeController;

  HomeSupplierTab({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeTabHeader(homeController: homeController),
        Observer(builder: (_) {
          return AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 1400,
            ),
            child:
                homeController.supplierPageTypeSelected == SupplierPageType.list
                    ? _HomeSupplierList()
                    : _HomeSupplierGrid(),
          );
        })
      ],
    );
  }
}

class _HomeTabHeader extends StatelessWidget {
  final HomeController homeController;

  const _HomeTabHeader({required this.homeController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const Text('Estabelecimentos'),
          const Spacer(),
          InkWell(
            onTap: () =>
                homeController.changeTabSupplier(SupplierPageType.list),
            child: Observer(builder: (_) {
              return Icon(
                Icons.view_headline,
                color: homeController.supplierPageTypeSelected ==
                        SupplierPageType.list
                    ? Colors.black
                    : Colors.grey,
              );
            }),
          ),
          InkWell(
            onTap: () =>
                homeController.changeTabSupplier(SupplierPageType.grid),
            child: Observer(builder: (_) {
              return Icon(
                Icons.view_compact_rounded,
                color: homeController.supplierPageTypeSelected ==
                        SupplierPageType.grid
                    ? Colors.black
                    : Colors.grey,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _HomeSupplierList extends StatelessWidget {
  const _HomeSupplierList();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  const _HomeSupplierGrid();

  @override
  Widget build(BuildContext context) {
    return const Text('afkldsjf');
  }
}
