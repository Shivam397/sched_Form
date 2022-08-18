// // ignore_for_file: prefer_const_constructors

// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:sch_form/models/model.dart';
// import 'package:path/path.dart' as Path;

// class coachP extends StatelessWidget {

//   coachProDetails c = new coachProDetails(
//     ExpectedIOHSS1DueDate: 'hello', 
//     iohSs1Date: 'hello', 
//     division: 'hello', 
//     CoachType: 'hello', 
//     builtYear: 0, 
//     extendedReturnDate: 'hello', 
//     maintenanceDepot: 'hello', 
//     destination: 'hello', 
//     nominatedWorkshop: 'hello', 
//     iohSs1Location: 'hello', 
//     coach_no: 'hello', 
//     kmFromLastPOH: 'hello', 
//     lastPOHSS2SS3Workshop: 'hello', 
//     manufacturedBy: 'hello', 
//     noOfTripAfterPOH: 'hello', 
//     POHSS2SS3Date: 'hello', 
//     returnDate: 'hello', 
//     source: 'hello', 
//     startDate: 'hello', 
//     startDateFromCmm: 'hello', 
//     totalKm: 'hello', 
//     trainNo: 'hello', 
//     trainNoFromCmm: 'hello',
//   );

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
    
//     var size = MediaQuery.of(context).size;

//     /*24 is for notification bar on Android*/
//     //final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//     final double itemWidth = size.width / 2;
//       int count;


//   primary: false;
//   padding: const EdgeInsets.all(20);
//   crossAxisSpacing: 10;
//   mainAxisSpacing: 10;
//   if (itemWidth > 1200)
//   count = 4;

// else
//   count = 2;
  
//   crossAxisCount: count;

//   children: var list = <Widget>[
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[100],
//       child: const Text("Coach Number: "),
//     ),
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[200],
//       child: Text(c.coach_no),
//     ),
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[300],
//       child: const Text('Sound of screams but the'),
//     ),
   
//   ];
//   }
// }
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text("Coach Pro Details"),
//     //   ),
//     //   body: gridView
//     //   //),
//     // );



