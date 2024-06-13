import 'package:intl/intl.dart';

String formatCurrency(double value) {
  final format = NumberFormat.currency(
    locale: 'id_ID', // Locale for Indonesia
    symbol: 'Rp', // Symbol for Indonesian Rupiah
    decimalDigits: 0, // Number of decimal digits
  );
  return format.format(value);
}
