import 'package:intl/intl.dart';

extension DateX on DateTime {
  String toPtBr() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
