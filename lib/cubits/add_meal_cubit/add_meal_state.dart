part of 'add_mael_cubit.dart';

@immutable
sealed class AddMealState {}

final class AddMealInitialState extends AddMealState {}

class AddMealFaliurState extends AddMealState{
final String errormessage;

  AddMealFaliurState({required this.errormessage});
}
class AddMealLoadedState extends AddMealState{

}
class AddMealSuccesState extends AddMealState{

}