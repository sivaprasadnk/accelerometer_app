import 'package:example/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accelerometer app',
      debugShowCheckedModeBanner: false,
      home: AccelerometerScreen(),
    );
  }
}

class AccelerometerScreen extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Real-time Accelerometer Data')),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('X: ${controller.x.value}'),
              Text('Y: ${controller.y.value}'),
              Text('Z: ${controller.z.value}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (!controller.isListening.value) {
                    controller.startListening();
                  }
                },
                child: Text('Start'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.isListening.value) {
                    controller.stopListening();
                  }
                },
                child: Text('Stop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
