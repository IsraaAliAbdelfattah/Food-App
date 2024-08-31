part of 'show_history_cubit.dart';

@immutable
sealed class ShowHistoryCubitState {}

final class ShowHistoryCubitInitialState extends ShowHistoryCubitState {}
final class ShowHistoryCubitLoadingState extends ShowHistoryCubitState {}
final class ShowHistoryCubitSuccessState extends ShowHistoryCubitState {}
