import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:sch_form/merged_form.dart';
import 'coach_pro_details.dart';
import 'package:open_file/open_file.dart';
import 'coach_pro_details.dart';
import 'package:sch_form/models/model.dart';
import 'sched_form.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "stateful App example",
    home: Sched(),
  ));
}

class sch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _schState();
  }
}

class _schState extends State<sch> {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    var isVisible = false;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Booking Details..."),
      ),
        body: 
      // SafeArea(
      //   child: (Width < 500)
      //       ? Column(
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.all(10.0),
      //               child: RaisedButton(
      //                 onPressed: () {
      //                   Navigator.push(context,
      //                       MaterialPageRoute(builder: (context) => merged()));
      //                 },
      //                 child: Text("View Details"),
      //                 color: Colors.blueAccent,
      //               ),
      //             ),
      //             Expanded(
      //               flex: 2,
      //                child: Container(
      //                  width: 1000.0,
      //                  height: 800.0,
      //                 child: Sched(),
      //               ),
      //             ),
      //           ],
      //         )
      //       : 
      //         Container(
      //           width: 1800.0,
      //           height: 800.0,
      //           child: merged(),
      //         ),

              Container(
                // width: 1800.0,
                // height: 800.0,
                child: Sched(),
              ),

        
      
    );
  }
}
