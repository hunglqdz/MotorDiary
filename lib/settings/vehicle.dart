import 'package:flutter/material.dart';
import 'package:motor_diary/setup/setup2.dart';
import 'package:provider/provider.dart';

class VehicleSetting extends StatelessWidget {
  const VehicleSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicle = Provider.of<VehicleProvider>(context).vehicle;

    return Scaffold(
      body: Column(
        children: [
          Text('Time for Oil change: ${vehicle.timeOil}'),
          Text('Distance for Oil change: ${vehicle.disOil}'),
          Text('Time for Maintenance: ${vehicle.timeMaintenance}'),
          Text('Distance for Maintenance: ${vehicle.disMaintenance}'),
        ],
      ),
    );
  }
}
