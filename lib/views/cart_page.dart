import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/cubits/add_history_cubit/cubit/add_history_cubit.dart';
import 'package:audio_to_text_app/cubits/food_cubit/food_cubit_cubit.dart';
import 'package:audio_to_text_app/cubits/show_history_cubit/cubit/show_history_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/views/payment_method.dart';
import 'package:audio_to_text_app/widgets/cart_page_list_view.dart';
import 'package:audio_to_text_app/widgets/custom_button.dart';
import 'package:audio_to_text_app/widgets/no_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // not working
    // BlocProvider.of<FoodCubit>(context).fetchAllMeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FoodModel> meals = context.read<FoodCubit>().meals ?? [];
    return BlocProvider(
      create: (context) => FoodCubit()..fetchAllMeals(),
      child: BlocProvider(
        create: (context) => AddHistoryCubit(),
        child: BlocConsumer<AddHistoryCubit, AddHistoryState>(
          listener: (context, state) {
            if (state is AddHistoryFaliurState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errormessage.toString())));
            }
            if (state is AddHistorySuccesState) {
              BlocProvider.of<ShowHistoryCubit>(context).fetchAllHistory();
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: scaffoldprimarycolor,
              body: meals.isEmpty
                  ? const NoOrders()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'Cart',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/swipe.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const Text(
                                  'swip left to ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                                const Text(
                                  'delete ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Color(0xffFF470B),
                                  ),
                                ),
                                const Text(
                                  ' an item, swip right to ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                                const Text(
                                  ' like',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Color(0xffEB4796)),
                                ),
                                const Text(
                                  ' it',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const CartPageListView(),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PaymentMethod()));
                              for (int i = 0; i < meals.length; i++) {
                                var mealsmodel = FoodModel(
                                  image: meals[i].image,
                                  price: meals[i].price,
                                  reviews: meals[i].reviews,
                                  foodName: meals[i].foodName,
                                  discription: meals[i].discription,
                                  amount: 2,
                                  discount: meals[i].discount,
                                );
                                BlocProvider.of<AddHistoryCubit>(context)
                                    .showHistory(mealsmodel);
                              }
                            },
                            text: 'Complete Order',
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            color: const Color(0xffFF470B),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
