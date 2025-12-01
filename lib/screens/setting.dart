import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      
      children: [
        
       
        Card(
          margin: EdgeInsets.all(4),
          child:Padding(padding: EdgeInsets.all(8),
          child:  Row(
            children: [RichText(text: TextSpan(
               
              children: [
                TextSpan(text: "Configurer les paramètre de l'application\n",style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "En developpement")

              ]
            ))],
          ),),
        ),
        Card(
          margin: EdgeInsets.all(4),
          child:Padding(padding: EdgeInsets.all(8),
          child:  Row(
            children: [RichText(text: TextSpan(
               
              children: [
                TextSpan(text: "Param2\n",style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "En dvlpp")

              ]
            ))],
          ),),
        )
      ],
    );
  }
}