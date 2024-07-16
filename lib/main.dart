import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/noteapp.dart';
import 'package:flutter_application_1/screens/testscreen.dart';


void main(){
  runApp(note());
}


class note extends StatelessWidget {
  const note({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage(),);
  }
}
