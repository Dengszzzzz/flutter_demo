import 'package:flutter/material.dart';


Widget createItem(BuildContext context,Widget route,String title){
  return ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => route));
    },
    child: Text(title),
  );
}