import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({
    super.key,
    required this.title,
    required this.callback,
  });
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback.call();
      },
      child: Text(title),
    );
  }
}
