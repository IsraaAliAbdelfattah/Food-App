import 'package:audio_to_text_app/cubits/show_favourite_cubit/cubit/show_favourite_cubit.dart';
import 'package:audio_to_text_app/widgets/favourite_list_view.dart';
import 'package:audio_to_text_app/widgets/no_favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  void initState() {
    // not working
    // BlocProvider.of<FoodCubit>(context).fetchAllMeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List meals = context.read<ShowFavouriteCubit>().meals ?? [];
    return BlocProvider(
      create: (context) => ShowFavouriteCubit()..fetchAllFavourite(),
      child: Scaffold(
        body: meals.isEmpty
            ? const Center(child: NoFavourite())
            : const Center(
                child: FavouriteListView(),
              ),
      ),
    );
  }
}
