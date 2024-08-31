import 'package:hive/hive.dart';
part 'food_model.g.dart';

@HiveType(typeId: 0)
class FoodModel extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String reviews;
  @HiveField(3)
  final String foodName;
  @HiveField(4)
  final String discount;
  @HiveField(5)
  final String discription;
  @HiveField(6)
  final int amount;

  FoodModel(
      {required this.discount,
      required this.discription,
      required this.amount,
      required this.image,
      required this.price,
      required this.reviews,
      required this.foodName});
}
