import 'package:climaapp/clima.dart';
import 'package:climaapp/history.dart';
import 'package:climaapp/home.dart';
import 'package:climaapp/post.dart';
import 'package:flutter/material.dart';

class NavApp extends StatefulWidget {
  const NavApp({super.key});

  @override
  State<NavApp> createState() => _NavAppState();
}

class _NavAppState extends State<NavApp> {

  int selectIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Clima(),
    ClimaTela(),
    ClimaHistoryScreen(),
    PostClimateScreen()
  ];

  void showItemTrap(int index){
    setState(() {
      selectIndex = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Monitoramento',
            backgroundColor: Color.fromARGB(255, 0, 50, 136)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historico',
            backgroundColor: Color.fromARGB(255, 103, 163, 212)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
            backgroundColor: Color.fromARGB(255, 177, 58, 58)
          )
        ],
        currentIndex: selectIndex,
        selectedItemColor:const Color.fromARGB(255, 96, 200, 226),
        onTap: showItemTrap,
      ),
    );
  }
}