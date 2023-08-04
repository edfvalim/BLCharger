//***********************************************************************
//  IMPORTANT: THIS SIMULATION IS INTENDED SOLELY FOR DEBUGGING PURPOSES
//***********************************************************************

import 'dart:async';
import 'dart:math';

class ChargingSessionData {
  // Stream controller for each piece of data
  final StreamController<double> _consumedPowerController = StreamController();
  final StreamController<double> _instantPowerController = StreamController();
  final StreamController<double> _instantPriceController = StreamController();
  final StreamController<Duration> _elapsedTimeController = StreamController();

  // Stream getters
  Stream<double> get consumedPower => _consumedPowerController.stream;
  Stream<double> get instantPower => _instantPowerController.stream;
  Stream<double> get currentPrice => _instantPriceController.stream;
  Stream<Duration> get elapsedTime => _elapsedTimeController.stream;

  // Constructor
  ChargingSessionData() {
    var consumedPower = 0.0;
    var elapsedSeconds = 0;
    var instantPrice = 0.0;
    var instantPower = 42.0;
    _instantPowerController.add(instantPower);

    // Simulation of a possible variation in the instant power
    Timer.periodic(Duration(seconds: Random().nextInt(30)),
        (Timer currentPowerTimer) {
      instantPower = 42 + Random().nextDouble();
      _instantPowerController.add(instantPower);
    });

    // This is where data from the real source will be pulled and added to stream.
    Timer.periodic(const Duration(seconds: 1), (Timer sessionTimer) {
      // Elapsed time
      elapsedSeconds = sessionTimer.tick;
      _elapsedTimeController.add(Duration(seconds: elapsedSeconds));

      // Add power consumed in one second to total power consumed (in kWh)
      consumedPower += instantPower / 3600.0;
      _consumedPowerController.add(consumedPower);

      // Instant price based on power consumed
      instantPrice = consumedPower * 1.9;
      _instantPriceController.add(instantPrice);
    });
  }

  // Close all streams when done
  void dispose() {
    _consumedPowerController.close();
    _instantPowerController.close();
    _instantPriceController.close();
    _elapsedTimeController.close();
  }
}
