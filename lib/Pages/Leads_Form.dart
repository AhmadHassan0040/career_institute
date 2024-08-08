// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LeadForm extends StatefulWidget {
  const LeadForm({super.key});

  @override
  State<LeadForm> createState() => _LeadFormState();
}

class _LeadFormState extends State<LeadForm> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.indigo.shade200,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffB81736), Color(0xff281537)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                                    Text('ONLINE'),
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
                                    Text('ON-CAMPUS'),
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
                    Text(
                      'Scroll Down',
                      style: TextStyle(color: Colors.white54),
                    ),
                    Icon(
                      Icons.arrow_downward_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
