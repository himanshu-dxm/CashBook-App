import 'package:expenses_record/screens/cashInOut.dart';
import 'package:expenses_record/screens/records.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool menuTapped = false;
  TextEditingController searchController = new TextEditingController();
  double balance = 0;
  double totalIN = 0,totalOUT = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecordsPage()
                    )
                );
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(width: 8,),
                    Text(
                        "Untitled Record"
                    ),
                    // SizedBox(width: 1,),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Icon(Icons.picture_as_pdf),
                  ),
                  SizedBox(width: 8,),
                  InkWell(
                    onTap: () {
                      menuTapped = !menuTapped;
                      setState(() {

                      });
                    },
                    child: Container(
                      child: (!menuTapped)?Icon(Icons.menu):Icon(Icons.menu_open),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [

          // Search Bar
          Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            )
          ),

          SizedBox(height: 3,),

          //Balance Container
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all()
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Net Balance",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          // color: Colors.purpleAccent
                        )
                      ),
                      Text(
                          "₹ $balance",
                          style: GoogleFonts.lato(
                              fontSize: 20,
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Divider(
                  thickness: 1.2,
                  color: Colors.black,
                ),
                SizedBox(height: 5,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Total Cash IN",
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                color: Colors.green
                              )
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                      Text(
                          "₹ $totalIN",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Colors.green
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                                "Total Cash OUT",
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  color: Colors.red
                                )
                            ),
                            Icon(
                              Icons.remove,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                      Text(
                          "₹ $totalOUT",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Colors.red
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),

          // Items List
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ExpenseTile();
              },
            ),
          ),

          SizedBox(height: 5,),

          // Bottom buttons
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  // margin: EdgeInsets.all(0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CashInOut("Cash In")
                              )
                          );
                        },
                        child: Text("Cash IN"),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
                        ),
                      ),
                      Icon(Icons.add)
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CashInOut("Cash Out")
                            )
                          );
                        },
                        child: Text("Cash OUT"),
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                        ),
                      ),
                      Icon(Icons.remove)
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseTile extends StatelessWidget {

  const ExpenseTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffF3F3F3),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        height: 120,
        width: 360,
      ),
    );
  }
}

