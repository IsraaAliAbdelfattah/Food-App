import 'package:audio_to_text_app/cubits/show_history_cubit/cubit/show_history_cubit.dart';
import 'package:audio_to_text_app/widgets/history_item.dart';
import 'package:audio_to_text_app/widgets/no_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
     List meals = context.read<ShowHistoryCubit>().meals ?? [];
    return Scaffold(
      body:meals.isEmpty? 
      const NoHistory()
      :const HistoryItem(),
    );
  }
}