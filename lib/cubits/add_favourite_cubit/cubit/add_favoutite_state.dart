part of 'add_favoutite_cubit.dart';

@immutable
sealed class AddFavouriteState {}

final class AddFavouriteInitialState extends AddFavouriteState {}

class AddFavouriteFaliurState extends AddFavouriteState{
final String errormessage;

  AddFavouriteFaliurState({required this.errormessage});
}
class AddFavouriteLoadedState extends AddFavouriteState{

}
class AddFavouriteSuccesState extends AddFavouriteState{

}
