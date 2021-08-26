import 'package:expenses_record/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future<Null> _saveData(BuildContext context , int ind) async {
    // ind=1=>Cash In else Cash Out implementation
    print(ind);
    Navigator.pop(context);
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Amount :",
                  labelStyle: GoogleFonts.lato(
                    fontSize: 18,
                  )
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            // SizedBox(height: 3,),

            // For Remarks
            Container(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Remarks :",
                  hintText: "No Remarks",
                  labelStyle: GoogleFonts.lato(
                    fontSize: 18,
                    fontStyle: FontStyle.italic
                  )
                ),
              ),
            ),

            Expanded(child: Container()),

            // Save button
            Container(
              // width: MediaQuery.of(context).size.width*0.5,
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("Save"),
                onPressed: () {
                  _saveData(context, (widget.title == "Cash In")?1:0);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(150,50)),
                  elevation: MaterialStateProperty.all(20),
                  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                  textStyle: MaterialStateProperty.all(GoogleFonts.lato(fontSize: 20)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)
                  ))
                ),
              ),
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}

