import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CashInOut extends StatefulWidget {
  final String title;
  CashInOut(this.title);

  @override
  _CashInOutState createState() => _CashInOutState();
}

class _CashInOutState extends State<CashInOut> {

  DateTime? selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2001),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        // timeString = selectedTime.format(context);
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.lato(
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [

            //For dateTime
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //For Date
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_sharp),
                          SizedBox(width: 5,),
                          Text("${selectedDate!.toLocal()}".split(' ')[0]),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.watch_later_sharp),
                          SizedBox(width: 5,),
                          Text(
                              "${selectedTime.format(context)}"
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),

            //For Amount
            Container(
              padding: EdgeInsets.all(8),
              child: TextFormField(

              ),
            ),
            SizedBox(height: 8,),

            // For Remarks
            Container(
              color: Colors.green,
            ),
            SizedBox(height: 8,),

            // Save button
            Container(
              color: Colors.yellow,
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}

