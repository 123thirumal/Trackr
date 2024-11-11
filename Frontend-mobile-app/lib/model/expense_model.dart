import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {work,food,travel}

const categoryIcons={
  Category.work: Icons.work,
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_rounded,
};

const categoryColor={
  Category.work: Color(0xFFFE4EAE),
  Category.food: Color(0xFF8B38FA),
  Category.travel: Color(0xFFFFB10F),
};

class Expenses{
  Expenses({required this.name,required this.amount, required this.date, required this.category}) : id=uuid.v4();

  final String name;
  final double? amount;
  final DateTime? date;
  final String id;
  final Category? category;
}