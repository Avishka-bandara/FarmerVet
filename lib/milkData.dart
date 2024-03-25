import 'package:intl/intl.dart';

class Milk {
  final String id;
  final String date;
  final String liter;
  final String cows;

  Milk({
    required this.id,
    required this.date,
    required this.liter,
    required this.cows,

  });

  factory Milk.fromMap(Map<String, dynamic> map, String id) {
    return Milk(
      id: id,
      date: map['date'],
      liter: map['liters'],
      cows:map['cows'],
    );
  }

  bool isInCurrentMonth() {
    final now = DateTime.now();
    final milkDate = DateFormat('dd/MM/yyyy').parse(date);
    return milkDate.year == now.year && milkDate.month == now.month;
  }
}

class MilkList {
  final List<Milk> milks;

  MilkList({required this.milks});

  double getTotalLiters() {
    double total = 0.0;
    for (var milk in milks) {
      total += double.parse(milk.liter);
    }
    return total;
  }

  double getTotalLitersthismonth() {
    double total = 0.0;
    for (var milk in milks) {
      if (milk.isInCurrentMonth()) {
        total += double.parse(milk.liter);
      }
    }
    return total;
  }

}