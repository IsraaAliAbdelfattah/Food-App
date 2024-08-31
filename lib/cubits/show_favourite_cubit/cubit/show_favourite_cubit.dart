import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


part 'show_favourite_state.dart';

class ShowFavouriteCubit extends Cubit<ShowFavouriteCubitState> {
   ShowFavouriteCubit() : super(ShowFavouriteCubitInitialState());
  List<FoodModel>? meals;

  static late Box favouriteboxBox;



   fetchAllFavourite() async {
    emit(ShowFavouriteCubitLoadingState());
    Box<FoodModel> favouriteBox = Hive.box<FoodModel>(
      favouritebox,
    );

    meals = favouriteBox.values.toList();
    // await notesBox.close();
    // await kfoodboxB/ox.close();

    emit(ShowFavouriteCubitSuccessState());
   print(meals?.length ?? -1);
  }
}
