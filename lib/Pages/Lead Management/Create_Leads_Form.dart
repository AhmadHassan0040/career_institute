// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:career_institute/DataHandling/Data.dart';
import 'package:career_institute/Modules/myDrawer.dart';
import 'package:career_institute/Startup_initial_Pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadForm extends StatefulWidget {
  const LeadForm({super.key});

  @override
  State<LeadForm> createState() => _LeadFormState();
}

class _LeadFormState extends State<LeadForm> {
  LeadData formData = Get.put(LeadData());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade900,
      drawer: myDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(Login(), transition: Transition.rightToLeftWithFade);
              },
              icon: Icon(Icons.logout))
        ],
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'CREATE NEW LEAD',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.greenAccent], // Your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blue, Colors.greenAccent])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: screenHeight,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "(All Fields marked with ",
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
                                    text: ' are required)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                ]),
                              ),
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
                                controller: formData.nameController,
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
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 55,
                              child: TextField(
                                controller: formData.emailController,
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
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 55,
                              child: TextField(
                                controller: formData.phoneNoController,
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
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 55,
                              child: TextField(
                                controller: formData.areaController,
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
                                        borderRadius:
                                            BorderRadius.circular(8))),
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
                                      value: formData.selectedCity,
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
                                      items: formData.City.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          formData.selectedCity = newValue;
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
                                      value: formData.selectedCountry,
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
                                      items:
                                          formData.Country.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          formData.selectedCountry = newValue;
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
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 10),
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
                                          value: formData.GenderOptions[0],
                                          groupValue: formData.currentGender,
                                          onChanged: (value) {
                                            setState(() {
                                              formData.currentGender =
                                                  value.toString();
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
                                          value: formData.GenderOptions[1],
                                          groupValue: formData.currentGender,
                                          onChanged: (value) {
                                            setState(() {
                                              formData.currentGender =
                                                  value.toString();
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
                                          value: formData.GenderOptions[2],
                                          groupValue: formData.currentGender,
                                          onChanged: (value) {
                                            setState(() {
                                              formData.currentGender =
                                                  value.toString();
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
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 10),
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
                                          value: formData.TMethodOptions[0],
                                          groupValue: formData.currentTMethod,
                                          onChanged: (value) {
                                            setState(() {
                                              formData.currentTMethod =
                                                  value.toString();
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
                                          value: formData.TMethodOptions[1],
                                          groupValue: formData.currentTMethod,
                                          onChanged: (value) {
                                            setState(() {
                                              formData.currentTMethod =
                                                  value.toString();
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
                                  value: formData.selectedCourse,
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
                                  items: formData.Courses.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      formData.selectedCourse = newValue;
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
                                  value: formData.selectedMSource,
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
                                  items: formData.MarketingOptions.map(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      formData.selectedMSource = newValue;
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
                                      value: formData.selectedOrigin,
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
                                      items: formData.OriginOptions.map(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          formData.selectedOrigin = newValue;
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
                                      value: formData.selectedCampus,
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
                                      items: formData.PreferredCampus.map(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          formData.selectedCampus = newValue;
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
                                controller: formData.dateController,
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
                                        borderRadius:
                                            BorderRadius.circular(8))),
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
                                label: formData.sliderValue.toString(),
                                thumbColor: Colors.blue.shade900,
                                activeColor: Colors.grey.shade900,
                                value: formData.sliderValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    formData.sliderValue = newValue;
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
                                controller: formData.remarksController,
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
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                            child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Text('Name: ' +
                                              formData.nameController.text +
                                              '\nEmail: ' +
                                              formData.emailController.text +
                                              '\nPhone No: ' +
                                              formData.phoneNoController.text +
                                              '\nArea: ' +
                                              formData.areaController.text +
                                              '\nDate: ' +
                                              formData.dateController.text +
                                              '\nRemarks: ' +
                                              formData.remarksController.text +
                                              '\nCity: ${formData.selectedCity}' +
                                              '\nCountry: ${formData.selectedCountry}' +
                                              '\nGender: ${formData.currentGender}' +
                                              '\nTeaching Method: ${formData.currentTMethod}' +
                                              '\nCourse: ${formData.selectedCourse}' +
                                              '\nMarketing Source: ${formData.selectedMSource}' +
                                              '\nOrigin: ${formData.selectedOrigin}' +
                                              '\nPreferred Campus: ${formData.selectedCampus}' +
                                              '\nProbability: ${formData.sliderValue}'),
                                        ));
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue.shade900,
                                    ),
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
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue.shade900,
                                    ),
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
                              height: 350,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _datePicked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());
    if (_datePicked != null) {
      setState(() {
        formData.dateController.text = _datePicked.toString().split(" ")[0];
      });
    }
  }
}
