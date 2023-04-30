import 'package:eplant/views/screens/cart_screen.dart';
import 'package:eplant/views/screens/favourite_screen.dart';
import 'package:eplant/views/screens/home_screen.dart';
import 'package:eplant/views/screens/schedule_screen.dart';
import 'package:flutter/material.dart';

const greenColor = Color(0xFFA6BB67);
const backgroundColor = Color(0xFFF6F8F7);
const blackColor = Colors.black;
const secondaryBackgroundColor = Color(0xFFF2F4EF);

var pageIndex = [
  HomeScreen(),
  CartScreen(),
  FavouriteScreen(),
  ScheduleScreen()
];
