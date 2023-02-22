import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class InputDataScreen extends GetView {
  const InputDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Text("input"),
      ),
    );
  }
}
