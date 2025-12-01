import 'package:flutter/material.dart';


class AppBar_P extends StatefulWidget{
  
  final String title;
  final List<Widget> actions;

  const AppBar_P({super.key, required this.title, this.actions= const []});
  
  @override
  State<AppBar_P> createState() => AppBar_PState();
    
}

class AppBar_PState extends State<AppBar_P>{
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        
        ...widget.actions,
      ],
    );
  }
}