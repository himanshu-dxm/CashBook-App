import 'package:expenses_record/models/DateTime.dart';
import 'package:expenses_record/models/Transcations.dart';
import 'package:expenses_record/utils/realtimeDB.dart';
import 'package:flutter/material.dart';

import '../json/day_month.dart';
import '../utils/Utilities.dart';


const List<String> list = <String>['Breakfast', 'Lunch', 'Dinner', 'Snacks' , 'Default'];

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _amountController = new TextEditingController();
  // TextEditingController _categoryController = new TextEditingController();
  TextEditingController _dateTimeController = new TextEditingController();

  DateTime date = DateTime.now();
  TimeOfDay time= TimeOfDay.now();

  String? dropDownValue = list.last;

  Future<void> addData() async {
    print(date.month);
    MyDateTime myDateTime = new MyDateTime(
        date: date.day,
        month: months[date.month-1],
        day: week[date.weekday-1],
        year: date.year,
        hour: time.hour,
        min: time.minute
    );
    // print("My Date Time\n${DateTime.now().millisecondsSinceEpoch}");
    String transactionId = "${date.toString().substring(0,10)} ${time.toString().substring(10,15)}";
    print("Transaction Id:$transactionId");
    Transactions transaction = new Transactions(
        transactionId: transactionId,
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        category: dropDownValue??"Default",
        dateTime: myDateTime,
        timestamp: DateTime.now().millisecondsSinceEpoch.toString()
    );
    // print("My Transaction\n$transaction");
    RealtimeDB obj = new RealtimeDB();
    await obj.writeData(transaction);
  }

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
            key: _formKey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Some Value';
                    } else {
                      return null;
                    }
                  },
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
                  validator: (value) {
                    double val = 0.0;
                    if (value == null || value.isEmpty) {
                      return 'Enter Some Value';
                    } else {
                      val=double.parse(value);
                    }
                    if(val < 0) {
                      return 'It cannot be negative';
                    } else if(val == 0.0) {
                      return 'You have entered Zero';
                    }
                    return null;
                  },
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
                        '${date.toString().substring(0,10)} \nClick to open Calendar',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
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
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      // ${time.toString().substring(10,15)}
                      'Time : ${time.format(context)}\nClick to open Clock',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Uploading Data'))
                        );
                        await addData().then((value) => Navigator.pop(context));
                      }

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