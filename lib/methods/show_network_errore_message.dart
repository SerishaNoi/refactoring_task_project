import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showNetworkErroreToast() {
  Fluttertoast.showToast(
    msg: "Please check your internet connection",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Color(0XFFEB6126),
    textColor: Colors.black,
    fontSize: 20,
  );
}
