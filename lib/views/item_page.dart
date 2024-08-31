import 'package:audio_to_text_app/cubits/add_favourite_cubit/cubit/add_favoutite_cubit.dart';
import 'package:audio_to_text_app/cubits/add_meal_cubit/add_mael_cubit.dart';
import 'package:audio_to_text_app/cubits/food_cubit/food_cubit_cubit.dart';
import 'package:audio_to_text_app/cubits/show_favourite_cubit/cubit/show_favourite_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.meal});
  final FoodModel meal;
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool pressed = false;
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMealCubit(),
      child:
          BlocConsumer<AddMealCubit, AddMealState>(listener: (context, state) {
        if (state is AddMealFaliurState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errormessage.toString())));
        }
        if (state is AddMealSuccesState) {
          BlocProvider.of<FoodCubit>(context).fetchAllMeals();
        }
      }, builder: (context, state) {
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
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        var mealsmodel = FoodModel(
                            discription: widget.meal.discription,
                            amount: widget.meal.amount,
                            discount: widget.meal.discount,
                            image: widget.meal.image,
                            price: widget.meal.price,
                            reviews: widget.meal.reviews,
                            foodName: widget.meal.foodName);
                        BlocProvider.of<AddFavouriteCubit>(context)
                            .showFavourite(mealsmodel);
                      },
                      icon: const Icon(Icons.favorite_outline),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          widget.meal.image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                       Text(
                        widget.meal.foodName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                       Text(
                        widget.meal.price,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFF470B),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.sizeOf(context).width / 1.55),
                        child: const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                       Text(
                        widget.meal.discription,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.sizeOf(context).width / 1.4),
                        child: const Text(
                          'Delivery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Text(
                        'Delivered within 30mins from your location* if placed now Cupon Available.',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       Row(
                        children: [
                          const Text(
                            'Reviews ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            widget.meal.reviews,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFA4A0C),
                            ),
                          ),
                          const Text(
                            'see all reviews',
                            style: TextStyle(
                              color: Color(0xff9A9A9D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<AddMealCubit, AddMealState>(
                        builder: (context, state) {
                          return CustomButton(
                            onPressed: () {
                              pressed = true;
                              setState(() {});
                              var mealsmodel = FoodModel(
                                 discription: widget.meal.discription,
                            amount: widget.meal.amount,
                            discount: widget.meal.discount,
                            image: widget.meal.image,
                            price: widget.meal.price,
                            reviews: widget.meal.reviews,
                            foodName: widget.meal.foodName);
                              BlocProvider.of<AddMealCubit>(context)
                                  .showMeals(mealsmodel);
                              
                            },
                            addtocartpress: pressed,
                            text: 'Add to cart',
                            color: const Color(0xffFA4A0C),
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
