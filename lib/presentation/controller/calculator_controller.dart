import 'package:get/get.dart';
import 'package:simple_calculator/domain/usecase/calculator_usecase.dart';

class CalculatorController extends GetxController {
  final CalculatorUseCase calculatorUseCase;

  // Observable fields for the inputs and result
  var firstNumber = ''.obs;
  var secondNumber = ''.obs;
  var result = ''.obs;

  // Current operator selected (+, -, *, /)
  var operator = ''.obs;

  CalculatorController(this.calculatorUseCase);

  // Set the numbers and the operator
  void setFirstNumber(String value) => firstNumber.value = value;
  void setSecondNumber(String value) => secondNumber.value = value;
  void setOperator(String value) => operator.value = value;

  // Perform the calculation
  void calculate() {
    final a = double.tryParse(firstNumber.value);
    final b = double.tryParse(secondNumber.value);

    if (a != null && b != null) {
      switch (operator.value) {
        case '+':
          result.value = calculatorUseCase.add(a, b).toString();
          break;
        case '-':
          result.value = calculatorUseCase.subtract(a, b).toString();
          break;
        case '*':
          result.value = calculatorUseCase.multiply(a, b).toString();
          break;
        case '/':
          try {
            result.value = calculatorUseCase.divide(a, b).toString();
          } catch (e) {
            result.value = 'Error';
          }
          break;
        default:
          result.value = 'Invalid operator';
      }
    } else {
      result.value = 'Invalid input';
    }
  }

  // Reset the calculator
  void reset() {
    firstNumber.value = '';
    secondNumber.value = '';
    result.value = '';
    operator.value = '';
  }
}
