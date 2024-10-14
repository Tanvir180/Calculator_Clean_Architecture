import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/presentation/controller/calculator_controller.dart';
import 'package:get_it/get_it.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    // Use GetIt to get the instance of CalculatorController
    final CalculatorController controller = GetIt.I<CalculatorController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Number Input
            TextField(
              onChanged: controller.setFirstNumber,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),

            // Second Number Input
            TextField(
              onChanged: controller.setSecondNumber,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Second Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),

            // Operator Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => controller.setOperator('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => controller.setOperator('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => controller.setOperator('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => controller.setOperator('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Result Display
            Obx(() => Text(
              'Result: ${controller.result}',
              style: const TextStyle(fontSize: 24),
            )),
            const SizedBox(height: 20),

            // Calculate and Reset Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: controller.calculate,
                  child: const Text('Calculate'),
                ),
                OutlinedButton(
                  onPressed: controller.reset,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
