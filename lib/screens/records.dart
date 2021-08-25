import 'package:flutter/material.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  SizedBox(width: 8,),
                  Center(
                    child: Text(
                        "Records Page"
                    ),
                  ),
                  // SizedBox(width: 1,),
                  // Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            // Container(
            //   child: Row(
            //     children: [
            //       Container(
            //         child: Icon(Icons.picture_as_pdf),
            //       ),
            //       SizedBox(width: 8,),
            //       InkWell(
            //         onTap: () {
            //           menuTapped = !menuTapped;
            //           setState(() {
            //
            //           });
            //         },
            //         child: Container(
            //           child: (!menuTapped)?Icon(Icons.menu):Icon(Icons.menu_open),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
