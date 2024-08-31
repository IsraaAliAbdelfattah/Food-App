import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/cubits/show_history_cubit/cubit/show_history_cubit.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryListview extends StatelessWidget {
  const HistoryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowHistoryCubit, ShowHistoryCubitState>(
      builder: (context, state) {
        List<FoodModel> meals = context.read<ShowHistoryCubit>().meals ?? [];

        if (state is ShowHistoryCubitLoadingState) {
          return const CircularProgressIndicator();
        }
        return Expanded(
          child: GestureDetector(
            onDoubleTap: () {
              for (var i in meals) {
                i.delete();
                BlocProvider.of<ShowHistoryCubit>(context).fetchAllHistory();
              }
            },
            child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    color: scaffoldprimarycolor,
                    child: HistoryCard(
                      meal: meals[index],
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
