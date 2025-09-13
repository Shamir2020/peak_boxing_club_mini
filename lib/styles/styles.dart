import 'package:flutter/material.dart';



TextStyle textHeader1(BuildContext context){
  return TextStyle(
      color: Theme.of(context).textTheme.titleLarge?.color,
      fontSize: 20,
      fontWeight: FontWeight.w600
  );
}

TextStyle textHeader2(BuildContext context){
  return TextStyle(
      color: Theme.of(context).textTheme.titleLarge?.color,
      fontSize: 18,
      fontWeight: FontWeight.w600
  );
}


TextStyle buttonText1(){
  return TextStyle(
      fontWeight: FontWeight.w700
  );
}

TextStyle normalText1(BuildContext context) {
  return TextStyle(
      height: 2,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodyMedium?.color
  );
}

TextStyle FormFieldText1(BuildContext context) {
  return TextStyle(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).textTheme.bodyMedium?.color
  );
}

TextStyle smallText1(BuildContext context){
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodyMedium?.color
  );
}

TextStyle smallText2(BuildContext context){
  return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodyMedium?.color
  );
}

const mainColor = Color.fromRGBO(156, 254, 79, 1);