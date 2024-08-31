part of 'show_favourite_cubit.dart';

@immutable
sealed class ShowFavouriteCubitState {}

final class ShowFavouriteCubitInitialState extends ShowFavouriteCubitState {}
final class ShowFavouriteCubitLoadingState extends ShowFavouriteCubitState {}
final class ShowFavouriteCubitSuccessState extends ShowFavouriteCubitState {}

