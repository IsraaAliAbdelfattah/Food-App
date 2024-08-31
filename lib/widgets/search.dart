import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/widgets/search_list_view.dart';
import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  const Search({super.key, required this.dishs});
  final List<FoodModel> dishs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 10),
        height: MediaQuery.sizeOf(context).height - 100,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 249, 249, 249),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              Text(
                'Found ${dishs.length} Results',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87
                ),
              ),
              SearchListView(
                dishs: dishs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
