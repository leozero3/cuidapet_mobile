// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../address_page.dart';

typedef AddressSelectedCallback = void Function(PlaceModel);

class _AddressSearchWidget extends StatefulWidget {
  final AddressSelectedCallback addressSelectedCallback;
  final PlaceModel? place;
  const _AddressSearchWidget({
    super.key,
    required this.addressSelectedCallback,
    required this.place,
  });

  @override
  State<_AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<_AddressSearchWidget> {
  final searchTextEC = TextEditingController();
  final searchTextFn = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.place != null) {
      searchTextEC.text = widget.place?.address ?? '';
      searchTextFn.requestFocus();
    }
  }

  final controller = Modular.get<AddressSearchController>();

  @override
  void dispose() {
    searchTextEC.dispose();
    searchTextFn.dispose();
    super.dispose();
  }

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
          controller: searchTextEC,
          focusNode: searchTextFn,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_on,
              color: Colors.black,
            ),
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
    searchTextEC.text = suggestion.address;
    widget.addressSelectedCallback(suggestion);
  }

  Future<List<PlaceModel>> _suggestionsCallback(String pattern) async {
    if (pattern.isNotEmpty) {
      return controller.searchAddress(pattern);
    }

    return <PlaceModel>[];
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
