// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodModelAdapter extends TypeAdapter<FoodModel> {
  @override
  final int typeId = 0;

  @override
  FoodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodModel(
      discount: fields[4] as String,
      discription: fields[5] as String,
      amount: fields[6] as int,
      image: fields[0] as String,
      price: fields[1] as String,
      reviews: fields[2] as String,
      foodName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FoodModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.reviews)
      ..writeByte(3)
      ..write(obj.foodName)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.discription)
      ..writeByte(6)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
