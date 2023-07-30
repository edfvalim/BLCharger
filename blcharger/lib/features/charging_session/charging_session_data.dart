//***********************************************************************
//  IMPORTANT: THIS SIMULATION IS INTENDED SOLELY FOR DEBUGGING PURPOSES
//***********************************************************************

import 'dart:async';
import 'dart:math';

class ChargingSessionData {
  // Stream controller for each piece of data
  final StreamController<double> _powerConsumedController = StreamController();
  final StreamController<double> _currentPowerController = StreamController();
  final StreamController<double> _currentPriceController = StreamController();
  final StreamController<Duration> _elapsedTimeController = StreamController();

  // Stream getters
  Stream<double> get powerConsumed => _powerConsumedController.stream;
  Stream<double> get currentPower => _currentPowerController.stream;
  Stream<double> get currentPrice => _currentPriceController.stream;
  Stream<Duration> get elapsedTime => _elapsedTimeController.stream;

  // Constructor
  ChargingSessionData() {
    var powerConsumed = 0.0;
    // This is where data from the real source will be pulled and added to stream.
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      // Elapsed time
      var elapsedSeconds = t.tick;
      _elapsedTimeController.add(Duration(seconds: elapsedSeconds));

      // Current power: 41.5 kW + random number between 0 and 0.5 kW
      var currentPower = 41.5 + Random().nextDouble() * 0.5;
      _currentPowerController.add(currentPower);

      // Power consumed: (average current power * elapsed time) / 3600 to convert to kW/h
      powerConsumed += currentPower / 3600.0;
      _powerConsumedController.add(powerConsumed);

      // Price: power consumed / 2
      var price = powerConsumed * 1.9;
      _currentPriceController.add(price);
    });
  }

  // Close all streams when done
  void dispose() {
    _powerConsumedController.close();
    _currentPowerController.close();
    _currentPriceController.close();
    _elapsedTimeController.close();
  }
}
