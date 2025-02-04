import 'package:intl/intl.dart';

extension Currency on double {
  String toPtBr() {
    return NumberFormat.simpleCurrency(locale: 'pt_BR').format(this);
  }
}

extension DoubleX on String? {
  double? toDouble() {
    final pureValue = this
        ?.trim()
        .replaceAll(r'R$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');
    if (pureValue != null) {
      return double.tryParse(pureValue);
    }

    return null;
  }
}
