import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/cubits/show_favourite_cubit/cubit/show_favourite_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/widgets/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


enum Actions { delete }

class FavouriteListView extends StatelessWidget {
  const FavouriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<ShowFavouriteCubit, ShowFavouriteCubitState>(
        builder: (context, state) {
          List meals = context.read<ShowFavouriteCubit>().meals ?? [];
          
          if (state is ShowFavouriteCubitLoadingState) {
            return const CircularProgressIndicator();
          }
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final FoodModel item = meals[index];
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: const StretchMotion(), children: [
                      SlidableAction(
                        onPressed: (context) =>
                            _onDismissed(context, index, Actions.delete, item),
                        backgroundColor: scaffoldprimarycolor,
                        icon: Icons.delete_outline,
                      ),
                    ]),
                    child: FavouriteCard(
                      meals: meals[index],
                    ),
                  );
                }),
          );
        },
      );
    });
  }

  void _onDismissed(
      BuildContext context, int index, Actions action, FoodModel meal) {
    if (action == Actions.delete) {
      meal.delete();
      BlocProvider.of<ShowFavouriteCubit>(context).fetchAllFavourite();
    }
  }
}
