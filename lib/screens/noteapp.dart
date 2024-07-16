import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/notesCard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  // void initState() {
  //   getData();
  //   // TODO: implement initState
  //   super.initState(

  //   );
  // }
var title = TextEditingController();
var notes = TextEditingController();

List titles=[];
List note=[];
List<String> addednote = [];
List<String> addedtitle = [];
setdata()async{
  // Obtain shared preferences.
final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setStringList('titles', addedtitle);
await prefs.setStringList('notes', addednote);

}
getData()async{
final SharedPreferences prefs = await SharedPreferences.getInstance();
final List<String>? titlesdata = prefs.getStringList('titles');
final List<String>? notesdata = prefs.getStringList('notes');
setState(() {
  titles = titlesdata!;
  note = notesdata!;
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              GestureDetector(
                child: Icon(
                  Icons.note_alt_outlined,
                  
                  color: Colors.white,
                ),onTap: (){
                  getData();
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "NOTES:",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 1, 41, 2),
        ),
        backgroundColor: Color.fromARGB(255, 176, 242, 173),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 185, 218, 24),
          // tooltip: 'Increment',
          onPressed: () {setdata();
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return NotesCard(items: items[index]);
          // },));
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                actions: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'title',
                    ),
                    controller: title,

                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "notes"),
                    controller: notes,

                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(onPressed: () {
                    addedtitle.add(title.text);
                    addednote.add(notes.text);
                    setdata();
                    Navigator.pop(context);
                  }, child: Text("ok"))
                ],
              ),
            );
          },
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
        body:titles.isEmpty?Center(child: CircularProgressIndicator()): MasonryGridView.builder(
            itemCount: titles.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => NotesCard(title: titles[index],note: note[index],)));
  }
}
