import 'package:flutter/material.dart';
import 'package:trackr/model/expense_model.dart';
class NewExpense extends StatefulWidget{
  const NewExpense({super.key,required this.addingExpense});

  final void Function(TextEditingController,TextEditingController,DateTime?,Category?) addingExpense;

  @override
  State<NewExpense> createState(){
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  DateTime? dateSelected;
  final _givenName=TextEditingController();
  final _givenAmount=TextEditingController();
  Category? _givenCategory=Category.work;

  void _selectedDate() async {
    final date= await showDatePicker(
        context: context,
        firstDate: DateTime(1900,1,1),
        lastDate: DateTime(2100,12,31),
    );
    setState(() {
      dateSelected=date;
    });
  }

  void _addingExpense(){
    if(_givenName.text.trim().isEmpty){
      showDialog(
          context: context,
          builder: (ctx){
            return AlertDialog(
              title: const Text('Enter a name for expense'),
              actions: [
                TextButton(onPressed:() {
                  Navigator.pop(ctx);
                },
                    child: const Text("Okay") )
              ],
            );
          });
    }
    else if(double.tryParse(_givenAmount.text)==null){
      showDialog(
          context: context,
          builder: (ctx){
            return AlertDialog(
              title: const Text('Enter a valid amount'),
              actions: [
                TextButton(onPressed:() {
                  Navigator.pop(ctx);
                },
                    child: const Text("Okay") )
              ],
            );
          });
    }
    else if(dateSelected==null){
      showDialog(
          context: context,
          builder: (ctx){
            return  AlertDialog(
              title: const Text('Select a date'),
              actions: [
                TextButton(onPressed:() {
                  Navigator.pop(ctx);
                },
                    child: const Text("Okay") )
              ],
            );
          });
    }
    else {
      setState(() {
        widget.addingExpense(_givenName,_givenAmount,dateSelected,_givenCategory);
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(context){
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
        child: Column(
          children: [
            TextField(
              maxLength: 50,
              controller: _givenName,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                label: Text('New Expense'),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _givenAmount,
                      decoration: const InputDecoration(
                        label: Text('Amount'),
                        prefixText: '₹'
                      ),
                    )
                ),
                const SizedBox(width: 20,),
                Text(dateSelected==null ?'Select Date' :'${dateSelected?.day.toString()}/${dateSelected?.month.toString()}/${dateSelected?.year.toString()}'),
                const SizedBox(width: 5,),
                IconButton(onPressed: _selectedDate, icon: const Icon(Icons.calendar_month)),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                DropdownButton(
                  value: _givenCategory,
                  items: Category.values.map((i) {
                    return DropdownMenuItem(
                      value: i,
                        child: Text(i.name));
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      _givenCategory=value;
                    });
                  },
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: _addingExpense,
                    child: const Text('Add')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}