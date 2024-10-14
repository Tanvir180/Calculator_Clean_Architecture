
import 'package:simple_calculator/domain/repository/calculator_repository.dart';

class CalculatorUseCase {
  final CalculatorRepository repository;

  CalculatorUseCase(this.repository);

  double add(double a, double b) => repository.add(a, b);
  double subtract(double a, double b) => repository.subtract(a, b);
  double multiply(double a, double b) => repository.multiply(a, b);
  double divide(double a, double b) => repository.divide(a, b);
}
