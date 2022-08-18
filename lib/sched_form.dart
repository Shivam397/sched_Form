import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'Common_widgets.dart/responsive.dart';

class Sched extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SchedState();
  }
}

class _SchedState extends State<Sched> {
  final _formKey = GlobalKey<FormState>();
  var _value;
  var _value2 = null;
  var _value3 = null;
  var _scheduleType = 'LHB';
  var mobile;
  DateTime now = DateTime.now();
  DateFormat format = DateFormat("dd-MM-yyyy HH:mm");
  TextEditingController _date = TextEditingController();
  var isVisible = false;

  var _curr = ['Select..', 'AJE', 'SE', 'PE', 'SPE', 'others'];
  var _curr2 = ['Select..', 'ABC', 'DE', 'PEG', 'SPEJ', 'others'];
  var _curr3 = ['Select..', 'A34E', 'RTSE', 'QPE', 'YSPE', 'others'];
  var _currency = 'Select..';
  var _currency2 = 'Select..';
  var _currency3 = 'Select..';

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    // var mar = Width / 2;
    return Scaffold(
        appBar: AppBar(
          title: Text("Schedule Booking Details..."),
        ),
        body: DefaultTextStyle.merge(
            style: TextStyle(color: Colors.white),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                      Color(0xFF0D47A1),
                      Color(0xFF8A2387),
                    ])),
                child: Responsive.isMobile(context)
                    ? viewComplete()
                    : Responsive.isTablet(context)
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: Width / 6),
                            child: viewComplete())
                        : Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: Width / 4),
                            child: viewComplete(),
                          ))));
  }

  Widget viewComplete() {
    var Width = MediaQuery.of(context).size.width;
    return ListView(children: <Widget>[
      Padding(padding: EdgeInsets.only(bottom: 10.0)),
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("Schedule Booking Details..",
                        style: TextStyle(
                            color: Colors.teal[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                  ],
                ))
          ]),
      Padding(
        padding: EdgeInsets.only(left: 0.0),
        child: (Width < 500)
            ? Column(
                children: [
                  radioButtons(),
                ],
              )
            : radioButtons(),
      ),

      Padding(padding: EdgeInsets.only(bottom: 10.0)),

      Container(
        decoration: BoxDecoration(),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(children: <Widget>[
                Text("Schedule Location"),
              ])),
          Container(
              child: (_value == 1)
                  ? Row(
                      children: [
                        depot(),
                        workshop(),
                      ],
                    )
                  : (_value == 2 || _value == 3)
                      ? Column(
                          children: [
                            workshop(),
                          ],
                        )
                      : (_value == 4)
                          ? Column(
                              children: [
                                depot(),
                              ],
                            )
                          : Container())
        ]),
      ),

      SizedBox(
        height: 20,
      ),

      //DROPDOWNS ONLY
      dropDowns(),

      SizedBox(
        height: 20,
      ),
      //

      textFields(),

      SizedBox(
        height: 20,
      ),
    ]);
  }

  Widget radioButtons() {
    var Width = MediaQuery.of(context).size.width;

    return Container(
        child: (_scheduleType == 'ICF')
            ? Row(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(children: <Widget>[
                          Text("Schedule Type"),
                        ])),
                  ]),
                  Row(
                    children: [
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          value: 1,
                          groupValue: _value,
                          onChanged: (val) {
                            setState(() {
                              _value = val;
                              _value2 = 4;
                              _value3 = null;
                            });
                          }),
                      Text('IOH')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                              _value2 = null;
                              _value3 = 5;
                            });
                          }),
                      Text('POH')
                    ],
                  ),
                ],
              )
            : (_scheduleType == 'LHB' && Width < 500)
                ?
                // #### try
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text("Schedule Type"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (val) {
                                    setState(() {
                                      _value = val;
                                      //_value2 = 4;
                                      //_value3 = null;
                                    });
                                  }),
                              Text('SS1')
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (val) {
                                    setState(() {
                                      _value = val;
                                      _value2 = 6;
                                      //_value3 = null;
                                    });
                                  }),
                              Text('SS2')
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  value: 3,
                                  groupValue: _value,
                                  onChanged: (val) {
                                    setState(() {
                                      _value = val;
                                      _value2 = 6;
                                      _value3 = null;
                                    });
                                  }),
                              Text('SS3')
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  value: 4,
                                  groupValue: _value,
                                  onChanged: (val) {
                                    setState(() {
                                      _value = val;
                                      _value2 = 5;
                                      _value3 = null;
                                    });
                                  }),
                              Text('D3 Schedule')
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                : (_scheduleType == 'LHB' && Width > 500)
                    ?
                    // #######
                    Row(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(children: <Widget>[
                                      Text("Schedule Type"),
                                    ])),
                              ]),
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (val) {
                                    setState(() {
                                      _value = val;
                                      //_value2 = 4;
                                      _value3 = null;
                                    });
                                  }),
                              Text('SS1')
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                      _value2 = 6;
                                      //_value3 = 5;
                                    });
                                  }),
                              Text('SS2')
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  value: 3,
                                  groupValue: _value,
                                  onChanged: (val) {
                                    setState(() {
                                      _value = val;
                                      _value2 = 6;
                                      _value3 = null;
                                    });
                                  }),
                              Text('SS3')
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  value: 4,
                                  groupValue: _value,
                                  onChanged: (val) {
                                    setState(() {
                                      _value = val;
                                      _value2 = 5;
                                      _value3 = null;
                                    });
                                  }),
                              Text('D3 Schedule')
                            ],
                          ),
                        ],
                      )
                    : Container());
  }

  Widget depot() {
    return Row(children: [
      Row(
        children: [
          Radio(
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              value: 5,
              groupValue: _value2,
              onChanged: (value) {
                setState(() {
                  _value2 = value;
                });
              }),
          Text('depot')
        ],
      ),
    ]);
  }

  Widget workshop() {
    return Row(
      children: [
        Radio(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            value: 6,
            groupValue: _value2,
            //groupValue: _value3,
            onChanged: (value) {
              setState(() {
                _value2 = value;
              });
            }),
        Text('workshop')
      ],
    );
  }

  //DROPDOWNS

  Widget dropDowns() {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          child: (_value2 == 5)
              ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(children: <Widget>[
                        Text("Booked depot"),
                      ])),
                  Padding(
                    padding: EdgeInsets.only(left: 90.0),
                    child: DropdownButton<String>(
                      items: _curr.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.deepOrange),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _onDropDownItemSelected1(newValue!);
                      },
                      value: _currency,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ])
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(children: <Widget>[
                          Text("Booked Workshop"),
                        ])),
                    Padding(
                        padding: EdgeInsets.only(left: 60.0),
                        child: Row(children: <Widget>[
                          DropdownButton<String>(
                            items: _curr.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.deepOrange),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              _onDropDownItemSelected1(newValue!);
                            },
                            value: _currency,
                          )
                        ])),
                  ],
                ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Row(children: <Widget>[
                    Text("POH/SS2/SS3/Location"),
                  ])),
              Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Row(children: <Widget>[
                    DropdownButton<String>(
                      items: _curr.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.deepOrange),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _onDropDownItemSelected1(newValue!);
                      },
                      value: _currency, //shows wt we selected
                    )
                  ])),
            ],
          ),
        ),
        Container(
          child: (_value == 1)
              ? Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(children: <Widget>[
                            Text("Reason"),
                          ])),
                      Padding(
                          padding: EdgeInsets.only(left: 125.0),
                          child: Row(children: <Widget>[
                            DropdownButton<String>(
                              items: _curr.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.deepOrange),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                _onDropDownItemSelected1(newValue!);
                              },
                              value: _currency, //shows wt we selected
                            )
                          ])),
                    ],
                  ),
                )
              : (_value == 2 || _value == 3)
                  ? Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Row(children: <Widget>[
                                Text("Reason"),
                              ])),
                          Padding(
                              padding: EdgeInsets.only(left: 125.0),
                              child: Row(children: <Widget>[
                                DropdownButton<String>(
                                  items:
                                      _curr2.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.deepOrange),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    _onDropDownItemSelected2(newValue!);
                                  },
                                  value: _currency2, //shows wt we selected
                                )
                              ])),
                        ],
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Row(children: <Widget>[
                                Text("Reason"),
                              ])),
                          Padding(
                              padding: EdgeInsets.only(left: 125.0),
                              child: Row(children: <Widget>[
                                DropdownButton<String>(
                                  items:
                                      _curr3.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.deepOrange),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    _onDropDownItemSelected3(newValue!);
                                  },
                                  value: _currency3, //shows wt we selected
                                )
                              ])),
                        ],
                      ),
                    ),
        )
      ]),
    );
  }

  //TEXTFIELDS

  Widget textFields() {
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: "Remarks",
              labelText: "Remarks",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: "Train Number",
              labelText: "Train Number",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: new DateTimeField(
            decoration: InputDecoration(
              hintText: "dd-mm-yyyy HH:MM",
              labelText: "Schedule Booking Date & Time",
              labelStyle: TextStyle(color: Colors.white),
              focusColor: Colors.white,
              contentPadding: const EdgeInsets.all(10),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
            format: format,
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));

              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, childWidget) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: childWidget!,
                    );
                  },
                );

                return DateTimeField.combine(date, time);
              } else {
                return date;
              }
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.purple)))),
            ),
          ],
        )
      ],
    ));
  }

  void _onDropDownItemSelected1(String newValue) {
    setState(() {
      this._currency = newValue;
    });
  }

  void _onDropDownItemSelected2(String newValue) {
    setState(() {
      this._currency2 = newValue;
    });
  }

  void _onDropDownItemSelected3(String newValue) {
    setState(() {
      this._currency3 = newValue;
    });
  }
}
