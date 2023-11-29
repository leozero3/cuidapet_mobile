part of '../address_page.dart';

class _AddressItem extends StatelessWidget {
  const _AddressItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.location_on,
            color: Colors.black,
          ),
        ),
        title: Text('Endereco aleatorio'),
        subtitle: Text('complemento sdfjsk'),
      ),
    );
  }
}
