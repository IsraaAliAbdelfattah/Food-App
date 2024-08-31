import 'package:audio_to_text_app/models/food_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';



import '../food_cubit/food_cubit_cubit.dart';

part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit() : super(AddMealInitialState());
  showMeals(FoodModel meal)async{
    emit(AddMealLoadedState());
    
    try {
    var box = FoodCubit.kfoodboxBox;


    await box.add(meal);
    
    // await box.close();


    //  var foodbox = Hive.box<FoodModel>(kfoodbox);
  
    //  await foodbox.add(meal);

     
     emit(AddMealSuccesState());
      } catch (e) {
  // TODO
  emit(AddMealFaliurState(errormessage: e.toString()));
   }
  } 
}
