import 'package:intl/intl.dart';

import 'milkData.dart';

class MilkListtotal {
  final List<Milk> milks;

  MilkListtotal({required this.milks});

  Map<String, double> getTotalLitersByMonth() {
    Map<String, double> totalLitersByMonth = {};

    for (var milk in milks) {
      final milkDate = DateFormat('dd/MM/yyyy').parse(milk.date);
      final monthYear = DateFormat('MM/yyyy').format(milkDate);

      if (totalLitersByMonth.containsKey(monthYear)) {
        totalLitersByMonth[monthYear] = double.parse(milk.liter);
      } else {
        totalLitersByMonth[monthYear] = double.parse(milk.liter);
      }
    }

    return totalLitersByMonth;
  }
}