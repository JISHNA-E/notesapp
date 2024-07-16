import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesCard extends StatefulWidget {
  final String title;
  final String note;
  
   const NotesCard({super.key, required this.title,required this.note});

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  String notes="";
  String title ="";
  var titles = TextEditingController();
var note = TextEditingController();
  // getdata()async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //  final String? action = prefs.getString('title');
  //  final String? actions = prefs.getString('notes');
  //  setState(() {
  //    title = action!;
  //      notes = actions!;
  //      if(title!=null){
  //       titles.text=title;
  //      }
  //      if(notes!=null){
  //       note.text=notes;
  //      }
  //      });
  //  }
  
  // @override
  // void initState() {
  //   getdata();
  //   // TODO: implement initState
  //   super.initState();
  // }




  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.all(8.0),
        
          child: Container(
            
                padding: const EdgeInsets.all(8.0),
            
            child: Column(
            children: [
              
              Container(
                child: Text(style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal),widget.title),
              ),
              
              Text(widget.note),
              
            ],
          ),
            
            
            // height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color.fromARGB(255, 112, 154, 48) ),
          
          )//just for testing, will fill with image later
          );
  }
}