// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
