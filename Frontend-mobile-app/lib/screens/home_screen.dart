import 'package:flutter/material.dart';
import 'package:trackr/widget/new_expense_widget.dart';
import 'package:trackr/widget/pie_chart_widget.dart';

import '../model/expense_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expenses> expensedata = [];

  void _addingNewExpense(
      TextEditingController givenName,
      TextEditingController givenAmount,
      DateTime? dateSelected,
      Category? givenCategory) {
    setState(() {
      expensedata.add(Expenses(
          name: givenName.text.trim(),
          amount: double.tryParse(givenAmount.text),
          date: dateSelected,
          category: givenCategory));
    });
  }

  void openBottomSheet() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            addingExpense: _addingNewExpense,
          );
        });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trackr'),
      ),
      body: expensedata.isEmpty
          ? const Center(
              child: Text('Press + to add expenses'),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Pie(expensedata: expensedata,),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: expensedata.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(6.0),
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 16.0,
                                height: 90.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: categoryColor[expensedata[index].category],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(expensedata[index].name),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(expensedata[index]
                                              .amount
                                              .toString()),
                                          const Spacer(),
                                          Icon(categoryIcons[
                                              expensedata[index].category]),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                              '${expensedata[index].date?.toLocal().day.toString()}-${expensedata[index].date?.toLocal().month.toString()}-${expensedata[index].date?.toLocal().year.toString()}')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: openBottomSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
