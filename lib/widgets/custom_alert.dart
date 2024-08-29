import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';


showCustomAlertDialog(BuildContext context,String message,CoolAlertType type){
  CoolAlert.show(
   context: context,
   type: type,
   text: message,
);
}