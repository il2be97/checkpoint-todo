import 'package:easy_localization/easy_localization.dart';

extension IntFormatting on int {
  String get commaSeparated {
    final formatter = NumberFormat('#,###', 'en_US');
    return formatter.format(this);
  }
}
