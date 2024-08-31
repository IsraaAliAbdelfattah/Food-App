part of 'add_history_cubit.dart';

@immutable
sealed class AddHistoryState {}

final class AddHistoryInitialState extends AddHistoryState {}

class AddHistoryFaliurState extends AddHistoryState{
final String errormessage;

  AddHistoryFaliurState({required this.errormessage});
}
class AddHistoryLoadedState extends AddHistoryState{

}
class AddHistorySuccesState extends AddHistoryState{

}
