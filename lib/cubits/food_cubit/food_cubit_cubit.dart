import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'food_cubit_state.dart';

class FoodCubit extends Cubit<FoodCubitState> {
  FoodCubit() : super(FoodCubitInitialState());
  List<FoodModel>? meals;

  static late Box kfoodboxBox;



   fetchAllMeals() async {
    emit(FoodCubitLoadingState());
    Box<FoodModel> foodBox = Hive.box<FoodModel>(
      kfoodbox,
    );

    meals = foodBox.values.toList();
    // await notesBox.close();
    // await kfoodboxB/ox.close();

    emit(FoodCubitSuccessState());
   print(meals?.length ?? -1);
  }
}
