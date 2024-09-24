// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//All data of the app will be handelled here.
//I used GetX statemanagement method

class DashboardData extends GetxController {
  String selectedPeriod = 'WEEKLY GRAPH';
  String selectedGraph = 'ADMISSIONS';

  int monthlyIncome = 1500;

  //Weekly
  int mon = 130;
  int tue = 130;
  int wed = 180;
  int thu = 175;
  int fri = 200;
  int sat = 170;
  int sun = 250;

  //Monthly
  int week1 = 150;
  int week2 = 175;
  int week3 = 190;
  int week4 = 220;

  //Yearly
  int jan = 120;
  int feb = 140;
  int mar = 180;
  int apr = 170;
  int may = 200;
  int jun = 220;
  int jul = 250;
  int aug = 190;
  int sep = 230;
  int oct = 210;
  int nov = 180;
  int dec = 240;

  //All Capmus Table Data
  int cifsd01Leads = 1;
  int cifsd01Admissions = 2;
  int cifsd01Collection = 3;

  int cifsd02Leads = 4;
  int cifsd02Admissions = 5;
  int cifsd02Collection = 6;

  int cifsd03Leads = 7;
  int cifsd03Admissions = 8;
  int cifsd03Collection = 9;

  int cifsd04Leads = 10;
  int cifsd04Admissions = 11;
  int cifsd04Collection = 12;

  int cifsd05Leads = 13;
  int cifsd05Admissions = 14;
  int cifsd05Collection = 15;

  int ciswl01Leads = 16;
  int ciswl01Admissions = 17;
  int ciswl01Collection = 18;

  int ciryk01Leads = 19;
  int ciryk01Admissions = 20;
  int ciryk01Collection = 21;

  int cisgd01Leads = 22;
  int cisgd01Admissions = 23;
  int cisgd01Collection = 24;

  int cilhr01Leads = 25;
  int cilhr01Admissions = 26;
  int cilhr01Collection = 27;

  int cilhe01Leads = 28;
  int cilhe01Admissions = 29;
  int cilhe01Collection = 30;

  int ciokr01Leads = 31;
  int ciokr01Admissions = 32;
  int ciokr01Collection = 33;
}

class LoginData extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
}

class LeadData extends GetxController {
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
}

class LeadFollowUPData extends GetxController {
  String leads = 'todays';

  void addTodaysLead(Map<String, String> lead) {
    TodaysLeads.add(lead);
    update();
  }

  void addPendingLead(Map<String, String> lead) {
    PendingLeads.add(lead);
    update();
  }

  RxList<Map<String, String>> TodaysLeads = <Map<String, String>>[
    {
      'Name': 'Ahmad',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
    {
      'Name': 'Hassan',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
    {
      'Name': 'Ahmad Nasir',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
    {
      'Name': 'Muhammad Hamza',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
    {
      'Name': 'Ahmad Hassan',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
  ].obs;
  RxList<Map<String, String>> PendingLeads = <Map<String, String>>[].obs;
}

class WEBSITELEADS extends GetxController {
  String leads = 'leads';

  void addWebsiteLeads(Map<String, String> lead) {
    WebsiteLeads.add(lead);
    update();
  }

  void addWebsiteAdmissions(Map<String, String> lead) {
    WebsiteAdmissions.add(lead);
    update();
  }

  RxList<Map<String, String>> WebsiteLeads = <Map<String, String>>[
    {
      'Name': 'Ahmad',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
    {
      'Name': 'Hassan',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
    {
      'Name': 'Ahmad Nasir',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
    {
      'Name': 'Muhammad Hamza',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
    {
      'Name': 'Ahmad Hassan',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
  ].obs;
  RxList<Map<String, String>> WebsiteAdmissions = <Map<String, String>>[].obs;
}

class TODAYSLEADS extends GetxController {
  RxList<Map<String, String>> TodaysLeads = <Map<String, String>>[
    {
      'Name': 'Ahmad',
      'Program': 'Flutter',
      'Contact': '03143902809',
      'Campus': 'CIFSD01',
    },
  ].obs;
}
