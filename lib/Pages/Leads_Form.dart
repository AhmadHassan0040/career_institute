// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:career_institute/Modules/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LeadForm extends StatefulWidget {
  const LeadForm({super.key});

  @override
  State<LeadForm> createState() => _LeadFormState();
}

class _LeadFormState extends State<LeadForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  List<String> City = [
    'City A',
    'City B',
    'City C',
    'City D',
    'City E',
  ];
  String? selectedCity;

  List<String> Country = [
    'Country A',
    'Country B',
    'Country C',
    'Country D',
    'Country E',
  ];
  String? selectedCountry;

  List<String> GenderOptions = ['MALE', 'FEMALE', 'OTHER'];
  String? currentGender;

  List<String> TMethodOptions = ['ONLINE', 'ON-CAMPUS'];
  String? currentTMethod;

  List<String> Courses = [
    'Course A',
    'Course B',
    'Course C',
    'Course D',
    'Course E',
  ];
  String? selectedCourse;

  List<String> MarketingOptions = [
    'Marketing Source A',
    'Marketing Source B',
    'Marketing Source C',
    'Marketing Source D',
    'Marketing Source E',
  ];
  String? selectedMSource;

  List<String> OriginOptions = [
    'Origin A',
    'Origin B',
    'Origin C',
    'Origin D',
    'Origin E',
  ];
  String? selectedOrigin;

  List<String> PreferredCampus = [
    'Campus A',
    'Campus B',
    'Campus C',
    'Campus D',
    'Campus E',
  ];
  String? selectedCampus;

  double sliderValue = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.indigo.shade200,
        key: _scaffoldKey,
        drawer: myDrawer(),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blueGrey.shade900,
            Colors.blue.shade900,
            Colors.greenAccent,
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 280.0),
                child: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 500,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            offset: Offset(5, 5))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    "Create New Lead (All Fields marked with ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.red),
                              ),
                              TextSpan(
                                text: ' are required',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ]),
                          ),
                          Divider(
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 55,
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  label: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'FULL NAME',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  hintText: "Enter Your Full Name...",
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  label: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'EMAIL ADDRESS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  hintText: "Enter Your Email Address...",
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            child: TextField(
                              controller: phoneNoController,
                              decoration: InputDecoration(
                                  label: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'PRIMARY CONTACT NUMBER',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  hintText: "Enter Your Contact Number...",
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            child: TextField(
                              controller: areaController,
                              decoration: InputDecoration(
                                  label: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'AREA',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  hintText: "Enter Your Area...",
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 135,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: selectedCity,
                                    borderRadius: BorderRadius.circular(8),
                                    hint: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: '- CITY -',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.red),
                                        ),
                                      ]),
                                    ),
                                    items: City.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedCity = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 135,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: selectedCountry,
                                    borderRadius: BorderRadius.circular(8),
                                    hint: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: '- COUNTRY -',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.red),
                                        ),
                                      ]),
                                    ),
                                    items: Country.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedCountry = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 10),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'GENDER',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                        activeColor: Colors.red.shade900,
                                        value: GenderOptions[0],
                                        groupValue: currentGender,
                                        onChanged: (value) {
                                          setState(() {
                                            currentGender = value.toString();
                                          });
                                        }),
                                    Text(
                                      'MALE',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Radio(
                                        activeColor: Colors.red.shade900,
                                        value: GenderOptions[1],
                                        groupValue: currentGender,
                                        onChanged: (value) {
                                          setState(() {
                                            currentGender = value.toString();
                                          });
                                        }),
                                    Text(
                                      'FEMALE',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Radio(
                                        activeColor: Colors.red.shade900,
                                        value: GenderOptions[2],
                                        groupValue: currentGender,
                                        onChanged: (value) {
                                          setState(() {
                                            currentGender = value.toString();
                                          });
                                        }),
                                    Text(
                                      'OTHER',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 10),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'TEACHING METHOD',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Radio(
                                        activeColor: Colors.red.shade900,
                                        value: TMethodOptions[0],
                                        groupValue: currentTMethod,
                                        onChanged: (value) {
                                          setState(() {
                                            currentTMethod = value.toString();
                                          });
                                        }),
                                    Text(
                                      'ONLINE',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Radio(
                                        activeColor: Colors.red.shade900,
                                        value: TMethodOptions[1],
                                        groupValue: currentTMethod,
                                        onChanged: (value) {
                                          setState(() {
                                            currentTMethod = value.toString();
                                          });
                                        }),
                                    Text(
                                      'ON-CAMPUS',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: DropdownButton<String>(
                                value: selectedCity,
                                borderRadius: BorderRadius.circular(8),
                                hint: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: '- COURSES INTERESTED -',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  ]),
                                ),
                                items: Courses.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedCourse = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: DropdownButton<String>(
                                value: selectedCity,
                                borderRadius: BorderRadius.circular(8),
                                hint: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: '- MARKETING SOURCE -',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  ]),
                                ),
                                items: MarketingOptions.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedMSource = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 95,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: selectedCity,
                                    borderRadius: BorderRadius.circular(8),
                                    hint: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: '- ORIGIN -',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ]),
                                    ),
                                    items: OriginOptions.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedOrigin = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 175,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: DropdownButton<String>(
                                    value: selectedCity,
                                    borderRadius: BorderRadius.circular(8),
                                    hint: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: '- PREFERRED CAMPUS -',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.red),
                                        ),
                                      ]),
                                    ),
                                    items: PreferredCampus.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedCampus = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 55,
                            child: TextField(
                              controller: dateController,
                              onTap: () {
                                _selectDate();
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.calendar_today),
                                  label: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'NEXT FOLLOW UP',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  hintText: "Select A Date...",
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'PROBABILITY',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            ]),
                          ),
                          Slider(
                              divisions: 10,
                              min: 0,
                              max: 100,
                              label: sliderValue.toString(),
                              thumbColor: Colors.red,
                              value: sliderValue,
                              onChanged: (newValue) {
                                setState(() {
                                  sliderValue = newValue;
                                });
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 100,
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              textAlignVertical: TextAlignVertical.top,
                              expands: true,
                              maxLines: null,
                              controller: remarksController,
                              decoration: InputDecoration(
                                  label: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'REMARKS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.red),
                                      ),
                                    ]),
                                  ),
                                  hintText: "Enter Remarks...",
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(colors: [
                                        Colors.blueGrey.shade900,
                                        Colors.blue.shade900,
                                        Colors.blue.shade900,
                                      ])),
                                  child: Center(
                                      child: Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(colors: [
                                        Colors.blue.shade900,
                                        Colors.greenAccent,
                                      ])),
                                  child: Center(
                                      child: Text(
                                    'CANCEL',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Animate(
                      effects: [
                        FadeEffect(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.easeInOut,
                        ),
                      ],
                      onComplete: (controller) {
                        controller.repeat(
                            reverse: true); // Repeat the animation infinitely
                      },
                      child: Text(
                        'Scroll Down',
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    Animate(
                      effects: [
                        FadeEffect(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.easeInOut,
                        ),
                        MoveEffect(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.easeInOut,
                        ),
                      ],
                      onComplete: (controller) {
                        controller.repeat(
                            reverse: true); // Repeat the animation infinitely
                      },
                      child: Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _selectDate() async {
    DateTime? _datePicked = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));
    if (_datePicked != null) {
      setState(() {
        dateController.text = _datePicked.toString().split(" ")[0];
      });
    }
  }
}
