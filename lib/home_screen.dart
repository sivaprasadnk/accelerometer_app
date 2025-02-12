import 'package:example/controller.dart';
import 'package:example/start_stop_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  HomeScreen({super.key});

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
              StartStopButton(
                callback: () {
                  if (!controller.isListening.value) {
                    controller.startListening();
                  } else {
                    controller.stopListening();
                  }
                },
                title: !controller.isListening.value ? 'Start' : 'Stop',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
