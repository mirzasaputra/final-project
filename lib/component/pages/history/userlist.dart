import 'package:flutter/material.dart';
import 'package:finalproject/component/pages/history/data.dart';
import 'package:finalproject/component/pages/history/colors.dart';

Widget userList(BuildContext context, int index) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      color: Colors.black12,
    ),
    width: double.infinity,
    height: 120,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_month,
                    color: secondary,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(details[index]['date'], style: TextStyle(color: primary, fontSize: 13, letterSpacing: .3)),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: secondary,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(details[index]['location'], style: TextStyle(color: primary, fontSize: 13, letterSpacing: .3)),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
