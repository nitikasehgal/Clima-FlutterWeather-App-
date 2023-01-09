import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 90.0,
    fontWeight: FontWeight.bold);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextfieldInputdecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city),
  hintText: 'Enter city name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);
