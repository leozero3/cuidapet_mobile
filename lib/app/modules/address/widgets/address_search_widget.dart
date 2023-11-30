// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../address_page.dart';

class _AddressSearchWidget extends StatefulWidget {
  const _AddressSearchWidget();

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        style: BorderStyle.none,
        color: Colors.black,
      ),
    );

    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: TypeAheadFormField<PlaceModel>(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            prefix: const Icon(Icons.location_on),
            hintText: 'Insira um endereço',
            border: border,
            disabledBorder: border,
            enabledBorder: border,
          ),
        ),
        itemBuilder: (_, item) {
          return _ItemTile(
            address: item.address,
          );
        },
        onSuggestionSelected: _onSuggestionSelected,
        suggestionsCallback: _suggestionsCallback,
      ),
    );
  }

  void _onSuggestionSelected(PlaceModel suggestion) {
    print(suggestion.address);
  }

  FutureOr<Iterable<PlaceModel>> _suggestionsCallback(String pattern) {
    print(pattern);
    return [PlaceModel(address: 'lsg,lrgd12gdgd5g4', lat: 544, lng: 54787)];
  }
}

class _ItemTile extends StatelessWidget {
  final String address;

  const _ItemTile({required this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on),
      title: Text(address),
    );
  }
}
