import 'dart:async';

import 'package:get/get.dart';
import 'package:native_accelerometer/native_accelerometer.dart';

class Controller extends GetxController {
  // Observables for sensor data
  var x = 0.0.obs;
  var y = 0.0.obs;
  var z = 0.0.obs;

  // Flag to check if sensor data is being fetched
  var isListening = false.obs;

  // Store the stream subscription
  StreamSubscription? _subscription;

  // Method to start listening to the accelerometer data
  void startListening() {
    if (!isListening.value) {
      _subscription = NativeAccelerometer.accelerometerStream.listen((event) {
        x.value = event["x"] ?? 0.0;
        y.value = event["y"] ?? 0.0;
        z.value = event["z"] ?? 0.0;
      });
      isListening.value = true;
    }
  }

  // Method to stop listening to the accelerometer data
  void stopListening() {
    _subscription?.cancel(); // Cancel the stream subscription
    _subscription = null; // Set to null to avoid multiple listeners

    // Reset sensor values
    x.value = 0.0;
    y.value = 0.0;
    z.value = 0.0;

    isListening.value = false;
  }
}
