// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:career_institute/DataHandling/Data.dart';
import 'package:career_institute/Modules/myAppBar.dart';
import 'package:career_institute/Modules/myDrawer.dart';
import 'package:career_institute/Startup_initial_Pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LeadForm extends StatefulWidget {
  const LeadForm({super.key});

  @override
  State<LeadForm> createState() => _LeadFormState();
}

class _LeadFormState extends State<LeadForm> {
  LeadData formData = Get.put(LeadData());
  String? viewMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey.shade900,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          viewMode = 'mob';
          return _mobileView();
        } else if (constraints.maxWidth >= 600 &&
            constraints.maxWidth <= 1024) {
          viewMode = 'tab';
          return _tabletView();
        } else {
          viewMode = 'win';
          return _windowView();
        }
      }),
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

  Widget _Form() {
    return ListView(
      children: [
        myAppBar(title: 'CREATE NEW LEAD', mode: viewMode!),
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
                    color: Colors.white),
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
                    color: Colors.white),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Divider(
            color: Colors.grey.shade400,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _fullName(),
        SizedBox(
          height: 15,
        ),
        _email(),
        SizedBox(
          height: 15,
        ),
        _primaryContactNumber(),
        SizedBox(
          height: 15,
        ),
        _area(),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _city(),
            SizedBox(
              width: 10,
            ),
            _country()
          ],
        ),
        SizedBox(
          height: 15,
        ),
        _gender(),
        SizedBox(
          height: 15,
        ),
        _teachingMethod(),
        SizedBox(
          height: 15,
        ),
        _coursesInterested(),
        SizedBox(
          height: 15,
        ),
        _marketingSource(),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _origin(),
            SizedBox(
              width: 10,
            ),
            _preferredCampus(),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        _nextFollowUp(),
        SizedBox(
          height: 15,
        ),
        _probability(),
        SizedBox(
          height: 15,
        ),
        _remarks(),
        SizedBox(
          height: 15,
        ),
        _submitBtns(),
        SizedBox(
          height: 350,
        ),
      ],
    );
  }

  Widget _mobileView() {
    return Center(
      child: Container(
        color: Colors.blueGrey.shade900,
        child: _Form(),
      ),
    );
  }

  Widget _tabletView() {
    return _mobileView();
  }

  Widget _windowView() {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: 304,
          color: Colors.white,
          child: drawerData(),
        ),
        Container(
          width: _screenWidth - 304,
          color: Colors.blueGrey.shade900,
          child: _Form(),
        ),
      ],
    );
  }

  Widget _fullName() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: formData.nameController,
        decoration: InputDecoration(
            label: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'FULL NAME',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
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
            hintStyle: TextStyle(fontSize: 12, color: Colors.white54),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _email() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: formData.emailController,
        decoration: InputDecoration(
            label: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'EMAIL ADDRESS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
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
            hintStyle: TextStyle(fontSize: 12, color: Colors.white54),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _primaryContactNumber() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: formData.phoneNoController,
        decoration: InputDecoration(
            label: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'PRIMARY CONTACT NUMBER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
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
            hintStyle: TextStyle(fontSize: 12, color: Colors.white54),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _area() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: formData.areaController,
        decoration: InputDecoration(
            label: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'AREA',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
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
            hintStyle: TextStyle(fontSize: 12, color: Colors.white54),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _city() {
    return Container(
      width: 135,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: DropdownButton<String>(
          value: formData.selectedCity,
          dropdownColor: Colors.grey.shade900,
          style: TextStyle(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          hint: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '- CITY -',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
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
    );
  }

  Widget _country() {
    return Container(
      width: 135,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: DropdownButton<String>(
          value: formData.selectedCountry,
          dropdownColor: Colors.grey.shade900,
          style: TextStyle(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          hint: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '- COUNTRY -',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
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
          items: formData.Country.map((String value) {
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
    );
  }

  Widget _gender() {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'GENDER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
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
                  activeColor: Colors.white,
                  value: formData.GenderOptions[0],
                  groupValue: formData.currentGender,
                  onChanged: (value) {
                    setState(() {
                      formData.currentGender = value.toString();
                    });
                  }),
              Text(
                'MALE',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Radio(
                  activeColor: Colors.white,
                  value: formData.GenderOptions[1],
                  groupValue: formData.currentGender,
                  onChanged: (value) {
                    setState(() {
                      formData.currentGender = value.toString();
                    });
                  }),
              Text(
                'FEMALE',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Radio(
                  activeColor: Colors.white,
                  value: formData.GenderOptions[2],
                  groupValue: formData.currentGender,
                  onChanged: (value) {
                    setState(() {
                      formData.currentGender = value.toString();
                    });
                  }),
              Text(
                'OTHER',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _teachingMethod() {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'TEACHING METHOD',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white),
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
                  activeColor: Colors.white,
                  value: formData.TMethodOptions[0],
                  groupValue: formData.currentTMethod,
                  onChanged: (value) {
                    setState(() {
                      formData.currentTMethod = value.toString();
                    });
                  }),
              Text(
                'ONLINE',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              Radio(
                  activeColor: Colors.white,
                  value: formData.TMethodOptions[1],
                  groupValue: formData.currentTMethod,
                  onChanged: (value) {
                    setState(() {
                      formData.currentTMethod = value.toString();
                    });
                  }),
              Text(
                'ON-CAMPUS',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _coursesInterested() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: DropdownButton<String>(
          value: formData.selectedCourse,
          dropdownColor: Colors.grey.shade900,
          style: TextStyle(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          hint: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '- COURSES INTERESTED -',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
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
    );
  }

  Widget _marketingSource() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: DropdownButton<String>(
          value: formData.selectedMSource,
          dropdownColor: Colors.grey.shade900,
          style: TextStyle(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          hint: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '- MARKETING SOURCE -',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
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
          items: formData.MarketingOptions.map((String value) {
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
    );
  }

  Widget _origin() {
    return Container(
      width: 95,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: DropdownButton<String>(
          value: formData.selectedOrigin,
          dropdownColor: Colors.grey.shade900,
          style: TextStyle(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          hint: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '- ORIGIN -',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
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
          items: formData.OriginOptions.map((String value) {
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
    );
  }

  Widget _preferredCampus() {
    return Container(
      width: 175,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: DropdownButton<String>(
          value: formData.selectedCampus,
          dropdownColor: Colors.grey.shade900,
          style: TextStyle(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          hint: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '- PREFERRED CAMPUS -',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
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
          items: formData.PreferredCampus.map((String value) {
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
    );
  }

  Widget _nextFollowUp() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: TextStyle(color: Colors.white),
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
                      color: Colors.white),
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _probability() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'PROBABILITY',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
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
        ],
      ),
    );
  }

  Widget _remarks() {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: TextStyle(fontSize: 12, color: Colors.white),
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
                      color: Colors.white),
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
            hintStyle: TextStyle(fontSize: 12, color: Colors.white54),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _submitBtns() {
    return Row(
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
                      borderRadius: BorderRadius.circular(12)),
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
              color: Colors.blueGrey.shade900,
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
              color: Colors.blueGrey.shade900,
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
    );
  }
}
