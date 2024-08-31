import 'package:audio_to_text_app/cubits/show_history_cubit/cubit/show_history_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'add_history_state.dart';

class AddHistoryCubit extends Cubit<AddHistoryState> {
  AddHistoryCubit() : super(AddHistoryInitialState());
  showHistory(FoodModel meal)async{
    emit(AddHistoryLoadedState());
    
    try {
    var box = ShowHistoryCubit.historyboxBox;


    await box.add(meal);
    
    // await box.close();


    //  var foodbox = Hive.box<FoodModel>(kfoodbox);
  
    //  await foodbox.add(meal);

     
     emit(AddHistorySuccesState());
      } catch (e) {

  emit(AddHistoryFaliurState(errormessage: e.toString()));
   }
  } 
}



