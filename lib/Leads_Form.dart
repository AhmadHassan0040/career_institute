import 'package:flutter/material.dart';

class LeadForm extends StatefulWidget {
  const LeadForm({super.key});

  @override
  State<LeadForm> createState() => _LeadFormState();
}

class _LeadFormState extends State<LeadForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
    );
  }
}
