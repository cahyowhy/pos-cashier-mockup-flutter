import 'package:intl/intl.dart';

String formatCurrency(int value, {String symbol = "Rp "}) {
  final NumberFormat currency = new NumberFormat("$symbol#,##0.00", "en_US");

  return currency.format(value);
}
