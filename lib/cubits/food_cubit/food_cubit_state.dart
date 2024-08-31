part of 'food_cubit_cubit.dart';


sealed class FoodCubitState {}

final class FoodCubitInitialState extends FoodCubitState {}
final class FoodCubitLoadingState extends FoodCubitState {}
final class FoodCubitSuccessState extends FoodCubitState {}
