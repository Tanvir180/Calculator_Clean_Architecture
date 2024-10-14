import 'package:get_it/get_it.dart';
import 'package:simple_calculator/data/repository/calculator_repository_impl.dart';
import 'package:simple_calculator/domain/repository/calculator_repository.dart';
import 'package:simple_calculator/domain/usecase/calculator_usecase.dart';
import 'package:simple_calculator/presentation/controller/calculator_controller.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Register the CalculatorRepository as CalculatorRepositoryImpl
  getIt.registerLazySingleton<CalculatorRepository>(() => CalculatorRepositoryImpl());

  // Register CalculatorUseCase
  getIt.registerLazySingleton<CalculatorUseCase>(() => CalculatorUseCase(getIt<CalculatorRepository>()));

  // Register CalculatorController
  getIt.registerFactory(() => CalculatorController(getIt<CalculatorUseCase>()));
}
