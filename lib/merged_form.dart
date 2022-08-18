import 'package:flutter/material.dart';
import 'package:sch_form/coach_pro_details.dart';
import 'sched_form.dart';

class merged extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _merged();
  }
}

class _merged extends State<merged> {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Booking Details..."),
      ),
      body: 
      // SafeArea(
      //   child: (Width < 500) ? 
      //     ListView(
      //       children: [
      //         Column(
      //           children: [
      //             Padding(padding: EdgeInsets.all(10.0)),
      //             ConstrainedBox(
      //               constraints: BoxConstraints.tightFor(width: 100, height: 30),
      //               child: RaisedButton(
      //                 child: Text('View Details'),
      //                 color: Colors.blueAccent,
      //                 onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //         Container(
      //           width: 1400,
      //           height: 1000,
      //           child: coachPro(),
      //         ),
      //         Container(
      //           width: 1400,
      //           height: 700,
      //           child: Sched(),
      //         ),
      //       ],
      //     ):

      //     ListView(
      //       children: [
      //         Container(
      //           width: 1400,
      //           height: 1000,
      //           child: coachPro(),
      //         ),
              Container(
                width: 1400,
                height: 700,
                child: Sched(),
              ),
    //         ],
    //       )


    //   ),
    );
  }
}
