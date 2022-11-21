import 'package:flutter/material.dart';

import '../utils/Utilities.dart';


const List<String> list = <String>['Breakfast', 'Lunch', 'Dinner', 'Snacks' , 'Default'];

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _amountController = new TextEditingController();
  // TextEditingController _categoryController = new TextEditingController();
  TextEditingController _dateTimeController = new TextEditingController();

  DateTime date = DateTime.now();
  TimeOfDay time= TimeOfDay.now();

  String? dropDownValue = list.last;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                Text(
                  'Title: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: black
                  ),
                ),
                TextFormField(
                  controller: _titleController,
                ),
                SizedBox(height: 8,),
                Text(
                  'Amount: ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: black
                  ),
                ),
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8,),
                Text(
                  'Category: ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: black
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.always,
                    value: dropDownValue,
                    elevation: 16,
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      size: 22,
                      color: primary,
                    ),
                    dropdownColor: Colors.deepOrangeAccent.shade100,
                    items: list.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value;
                        print("Selected category value = "+dropDownValue!);
                      });
                    },

                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'Date & Time: ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: black
                  ),
                ),
                // TextFormField(),
                InkWell(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2101),
                      builder: (BuildContext context,Widget? child) {
                          return Theme(data: ThemeData.dark(), child: child!,);
                      },
                    );
                    if(picked!=null && picked != date) {
                      setState(() {
                        date=picked;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                        '${date.toString().substring(0,10)} \n\nClick to open Calendar',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: time,
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.dark(),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null && picked != time)
                      setState(() {
                        time = picked;
                      });
                  },
                  child: Text(
                    '${time.toString().substring(10,15)} \n\nClick to open Clock',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed: () {

                    },
                    child: Text('Submit'),
                    color: primary,
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}