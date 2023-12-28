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
        Flexible(
          child: Observer(builder: (_) {
            return AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 1400,
              ),
              child: homeController.supplierPageTypeSelected ==
                      SupplierPageType.list
                  ? const _HomeSupplierList()
                  : const _HomeSupplierGrid(),
            );
          }),
        )
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
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return const _HomeSupplierListItemWidget();
            },
          ),
        ),
      ],
    );
  }
}

class _HomeSupplierListItemWidget extends StatelessWidget {
  const _HomeSupplierListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            width: 1.sw,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Clinica abc',
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                            ),
                            Text('1.67 km de distancia'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: context.primaryColor,
                    maxRadius: 15,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[100]!,
                  width: 5,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HomeSupplierGrid extends StatelessWidget {
  const _HomeSupplierGrid();

  @override
  Widget build(BuildContext context) {
    return const Text('afkldsjf');
  }
}
