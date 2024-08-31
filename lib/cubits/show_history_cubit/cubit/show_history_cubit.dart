import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'show_history_state.dart';


class ShowHistoryCubit extends Cubit<ShowHistoryCubitState> {
   ShowHistoryCubit() : super(ShowHistoryCubitInitialState());
  List<FoodModel>? meals;

  static late Box historyboxBox;



   fetchAllHistory() async {
    emit(ShowHistoryCubitLoadingState());
    Box<FoodModel> historyBox = Hive.box<FoodModel>(
      historybox,
    );

    meals = historyBox.values.toList();
    // await notesBox.close();
    // await kfoodboxB/ox.close();

    emit(ShowHistoryCubitSuccessState());
   
  }
}
