import 'package:audio_to_text_app/cubits/show_favourite_cubit/cubit/show_favourite_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'add_favoutite_state.dart';


class AddFavouriteCubit extends Cubit<AddFavouriteState> {
  AddFavouriteCubit() : super(AddFavouriteInitialState());
  showFavourite(FoodModel meal)async{
    emit(AddFavouriteLoadedState());
    
    try {
    var box = ShowFavouriteCubit.favouriteboxBox;


    await box.add(meal);
    
    // await box.close();


    //  var foodbox = Hive.box<FoodModel>(kfoodbox);
  
    //  await foodbox.add(meal);

     
     emit(AddFavouriteSuccesState());
      } catch (e) {
 
  emit(AddFavouriteFaliurState(errormessage: e.toString()));
   }
  } 
}
