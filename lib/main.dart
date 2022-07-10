// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home() 
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people =0 ;
  String _infoText = "Pode entrar";

  void changePeople(int delta){
    setState(() {
      _people+=delta;

      if(_people < 0){
        _infoText = "Mundo invertido!";
      }else if(_people <= 10){
        _infoText = "Pode entrar!";
      }else{
        _infoText = "Cheia!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "image/restaurant.jpg",
          fit:  BoxFit.cover,
          height: 1000.0,
        ),
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Pessoas: $_people",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold 
          )), 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: EdgeInsets.all(10.0),
              child:TextButton( 
                  child: Text("+1", style: TextStyle(color: Colors.white,fontSize: 40.0)),
                  onPressed: () {changePeople(1);},
                  ),
              ),
              Padding(
              padding: EdgeInsets.all(10.0),
              child:TextButton( 
                  child: Text("-1", style: TextStyle(color: Colors.white,fontSize: 40.0)),
                  onPressed: () {changePeople(-1);},
                  ),
              )
            
          ]
        ),
          Text("$_infoText",
            style: TextStyle(color: Colors.white, 
            fontStyle: FontStyle.italic,
            fontSize: 30.0),
          )
        ],
    )
      ],
    ) ;
  }
}