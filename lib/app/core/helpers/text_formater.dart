import 'package:intl/intl.dart';

class TextFormater {
  static final _formaterRealPattern =
      NumberFormat.currency(locale: 'pt_BR', symbol: r'RS');

  TextFormater._();

  static String formatReal(double value) => _formaterRealPattern.format(value);
}
