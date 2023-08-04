//***********************************************************************
//  IMPORTANT: THIS SIMULATION IS INTENDED SOLELY FOR DEBUGGING PURPOSES
//***********************************************************************

import 'dart:async';
import 'dart:math';
import 'package:rxdart/rxdart.dart';

class ChargingSessionData {
  static const double initialInstantPower = 42.0;
  static const double powerPriceFactor = 1.9;
  static const int powerVariationIntervalMax = 30;

  final BehaviorSubject<Duration> _elapsedTimeController = BehaviorSubject();
  final BehaviorSubject<double> _instantPowerController = BehaviorSubject();
  final BehaviorSubject<double> _consumedPowerController = BehaviorSubject();
  final BehaviorSubject<double> _instantPriceController = BehaviorSubject();

  // Timers
  Timer? _powerVariationTimer;
  Timer? _sessionTimer;

  ValueStream<Duration> get elapsedTime => _elapsedTimeController.stream;
  ValueStream<double> get instantPower => _instantPowerController.stream;
  ValueStream<double> get consumedPower => _consumedPowerController.stream;
  ValueStream<double> get instantPrice => _instantPriceController.stream;

  ChargingSessionData() {
    var consumedPower = 0.0;
    var elapsedSeconds = 0;
    var instantPower = initialInstantPower;
    _instantPowerController.add(instantPower);

    // Simulation of a possible variation in the instant power
    _powerVariationTimer = Timer.periodic(
        Duration(seconds: Random().nextInt(powerVariationIntervalMax)),
        (Timer instantPowerTimer) {
      instantPower = initialInstantPower + Random().nextDouble();
      _instantPowerController.add(instantPower);
    });

    // This is where data from the real source will be pulled and added to stream.
    _sessionTimer =
        Timer.periodic(const Duration(seconds: 1), (Timer sessionTimer) {
      // Elapsed time
      elapsedSeconds = sessionTimer.tick;
      _elapsedTimeController.add(Duration(seconds: elapsedSeconds));

      // Add power consumed in one second to total power consumed (in kWh)
      consumedPower += instantPower / 3600.0;
      _consumedPowerController.add(consumedPower);

      // Instant price based on power consumed
      var instantPrice = consumedPower * powerPriceFactor;
      _instantPriceController.add(instantPrice);
    });
  }

  void dispose() {
    _powerVariationTimer?.cancel();
    _sessionTimer?.cancel();

    _consumedPowerController.close();
    _instantPowerController.close();
    _instantPriceController.close();
    _elapsedTimeController.close();
  }
}
