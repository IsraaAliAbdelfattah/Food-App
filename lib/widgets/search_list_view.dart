import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.dishs});
  final List<FoodModel> dishs;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(10),
        itemCount: dishs.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding:
              index == 1 ? const EdgeInsets.only(top: 60) : EdgeInsets.zero,
          child: FoodItemCard(
            image: dishs[index].image,
            price:'${ dishs[index].price}',
            foodName: dishs[index].foodName,
          ),
        ),
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
        mainAxisSpacing: 10,
        crossAxisSpacing: 25,
      ),
    );
  }
}
