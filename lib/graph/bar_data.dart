import 'individual_bar.dart';

class BarData {
  final double odo1;
  final double odo2;
  final double odo3;
  final double odo4;
  final double odo5;

  BarData({
    required this.odo1,
    required this.odo2,
    required this.odo3,
    required this.odo4,
    required this.odo5,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: odo1),
      IndividualBar(x: 1, y: odo2),
      IndividualBar(x: 2, y: odo3),
      IndividualBar(x: 3, y: odo4),
      IndividualBar(x: 4, y: odo5),
    ];
  }
}
