import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../model/bucket_model.dart';
import '../model/expense_model.dart';

class Pie extends StatefulWidget {
  const Pie({super.key, required this.expensedata});

  final List<Expenses> expensedata;

  @override
  State<Pie> createState() {
    return _PieState();
  }
}

class _PieState extends State<Pie> {
  double? work_val, food_val, travel_val;
  List<Bucket> bucketList = [];

  double maxOfTotAmt = 0;

  void _initializeBucket() {
    bucketList = []; //0->work, 1->travel, 2->food

    //for work
    bucketList.add(Bucket.forCategory(widget.expensedata, Category.work));
    bucketList[0].calculateTotAmt();

    //for travel
    bucketList.add(Bucket.forCategory(widget.expensedata, Category.travel));
    bucketList[1].calculateTotAmt();

    //for food
    bucketList.add(Bucket.forCategory(widget.expensedata, Category.food));
    bucketList[2].calculateTotAmt();
  }

  void _calculateMaxOfTotAmt() {
    maxOfTotAmt = 0;
    for (int i = 0; i < bucketList.length; i++) {
      if (maxOfTotAmt < bucketList[i].totalAmount) {
        maxOfTotAmt = bucketList[i].totalAmount;
      }
    }
  }

  void _initializePieValues() {
    work_val = bucketList[0].totalAmount / maxOfTotAmt;
    travel_val = bucketList[1].totalAmount / maxOfTotAmt;
    food_val = bucketList[2].totalAmount / maxOfTotAmt;
  }

  @override
  Widget build(context) {
    setState(() {
      _initializeBucket();
      _calculateMaxOfTotAmt();
      _initializePieValues();
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  //for work
                  color: categoryColor[Category.work],
                  value: work_val, // Value of the section
                  radius: 50,
                  title: null, // Radius of the section
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff),
                  ),
                  showTitle: false,
                ),
                PieChartSectionData(
                  //for travel
                  color: categoryColor[Category.travel],
                  value: travel_val,
                  radius: 50,
                  title: null,
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff),
                  ),
                  showTitle: false,
                ),
                PieChartSectionData(
                  //for food
                  color: categoryColor[Category.food],
                  value: food_val,
                  radius: 50,
                  title: null,
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff),
                  ),
                  showTitle: false,
                ),
              ],
              centerSpaceRadius: 30,
              sectionsSpace: 5,
            ),

          ),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      //for work
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                          color: categoryColor[Category.work]),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Text(
                      'Work',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      //for work
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                          color: categoryColor[Category.travel]),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Text(
                      'Travel',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      //for work
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                          color: categoryColor[Category.food]),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Text(
                      'Food',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
