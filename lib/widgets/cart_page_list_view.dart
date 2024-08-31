import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/cubits/add_favourite_cubit/cubit/add_favoutite_cubit.dart';
import 'package:audio_to_text_app/cubits/food_cubit/food_cubit_cubit.dart';
import 'package:audio_to_text_app/cubits/show_favourite_cubit/cubit/show_favourite_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actions { delete, favorite }

class CartPageListView extends StatelessWidget {
  const CartPageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<FoodCubit, FoodCubitState>(
        builder: (context, state) {
          List<FoodModel> meals = context.read<FoodCubit>().meals ?? [];
         
          if (state is FoodCubitLoadingState) {
            return const CircularProgressIndicator();
          }
          return BlocProvider(
            create: (context) => AddFavouriteCubit(),
            child: BlocConsumer<AddFavouriteCubit, AddFavouriteState>(
              listener: (context, state) {
                if (state is AddFavouriteFaliurState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errormessage.toString())));
                }
                if (state is AddFavouriteSuccesState) {
                  BlocProvider.of<ShowFavouriteCubit>(context)
                      .fetchAllFavourite();
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: meals.length,
                      itemBuilder: (context, index) {
                        final FoodModel item = meals[index];
                        return Slidable(
                          startActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => _onDismissed(
                                    context,
                                    index,
                                    Actions.favorite,
                                    FoodModel(
                                      discount: item.discount,
                                      discription: item.discription,
                                      amount: 2,
                                      image: item.image,
                                      price: item.price,
                                      reviews: item.reviews,
                                      foodName: item.foodName,
                                    ),
                                  ),
                                  backgroundColor: scaffoldprimarycolor,
                                  icon: Icons.favorite_outline,
                                ),
                              ]),
                          endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => _onDismissed(
                                      context, index, Actions.delete, item),
                                  backgroundColor: scaffoldprimarycolor,
                                  icon: Icons.delete_outline,
                                ),
                              ]),
                          child: CartCard(
                            meals: meals[index],
                          ),
                        );
                      }),
                );
              },
            ),
          );
        },
      );
    });
  }

  void _onDismissed(
      BuildContext context, int index, Actions action, FoodModel meal) {
    if (action == Actions.delete) {
      meal.delete();
      BlocProvider.of<FoodCubit>(context).fetchAllMeals();
    }
    if (action == Actions.favorite) {
      var mealsmodel = meal;
      BlocProvider.of<AddFavouriteCubit>(context).showFavourite(mealsmodel);
    }
  }
}
