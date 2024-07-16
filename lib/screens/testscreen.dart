import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
var agecontroller = TextEditingController();
  var nameController = TextEditingController(); 
  String namedata = "";
  int ageData= 0;
setdata()async{
final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString('name',nameController.text );
await prefs.setInt('age',int.parse( agecontroller.text) );
}


getData()async{
final SharedPreferences prefs = await SharedPreferences.getInstance();
final String? name = prefs.getString('name');
// Try reading data from the 'counter' key. If it doesn't exist, returns null.
final int? age = prefs.getInt('age');
setState(() {
  namedata = name!;
  ageData = age!;
});

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Text(namedata),Text(ageData.toString()),
      TextField(controller: nameController,),
      TextField(controller: agecontroller,),
      ElevatedButton(onPressed: () {
        setdata();
      }, child: Text("set data")),ElevatedButton(onPressed: () {
        getData();
      }, child: Text("get data"))
    ],),);
  }
}