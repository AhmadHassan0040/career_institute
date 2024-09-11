// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FollowUPLeads extends StatelessWidget {
  int Sr;
  String Name;
  String Program;
  String Contact;
  String Campus;

  FollowUPLeads(
      {super.key,
      required this.Sr,
      required this.Name,
      required this.Program,
      required this.Contact,
      required this.Campus});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 30,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black26),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(5))),
            child: Center(child: Text(Sr.toString())),
          ),
          Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            child: Center(
              child: Text(Name),
            ),
          ),
          Container(
            height: 30,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            child: Center(
              child: Text(Program),
            ),
          ),
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            child: Center(
              child: Text(Contact),
            ),
          ),
          Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            child: Center(
              child: Text(Campus),
            ),
          ),
          Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black26),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(5))),
            child: Center(
                child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => _ActionsDialog());
                    },
                    icon: Icon(Icons.arrow_drop_down, size: 15))),
          ),
        ],
      ),
    );
  }

  Widget _ActionsDialog() {
    return Dialog(
      backgroundColor: Colors.grey.shade900,
      alignment: Alignment(1, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        height: 560,
        width: 100,
        child: Center(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.file_open_outlined, color: Colors.blue),
                title: Text('Register Now'),
                titleTextStyle: TextStyle(color: Colors.white),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading:
                    Icon(Icons.phone_forwarded_outlined, color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Follow-Up Call'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.message_outlined, color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Send SMS'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.email_outlined, color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Send Email'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.whatsapp,
                    color: Colors.greenAccent),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Whatsapp'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.directions_walk, color: Colors.blue),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Walk-In Status'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.hourglass_top, color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Start Trail'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.multiple_stop, color: Colors.yellow),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Transfer Lead'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading:
                    Icon(Icons.cancel_presentation_sharp, color: Colors.red),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Not Interested'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.edit_document, color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white),
                title: Text('Edit'),
                hoverColor: Colors.white12,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
