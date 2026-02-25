import 'package:flutter/material.dart';
import 'package:flutter_ppkd/tugas/tugas9/list.dart';
import 'package:flutter_ppkd/tugas/tugas9/list_map.dart';
import 'package:flutter_ppkd/tugas/tugas9/model.dart';

class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  int _selectedIndex = 0;

 final List<Widget> _widgetOptions = const [
    HalamanList(),
    HalamanListMap(),
    HalamanModel(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
        title: const Text("Tugas 9"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
  drawer: Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget> [
      const DrawerHeader(         
        decoration: BoxDecoration(
          color: Colors.amberAccent,
        ),
        child: Text(
          "Tugas 9",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          )
          ),
        ),
        ListTile(
          leading: const Icon(Icons.task),
          title: const Text("List string"),
          selected: _selectedIndex == 0,
          onTap: () {
            _onItemTapped(0);
          },
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text("List Map"),
          selected: _selectedIndex == 0,
          onTap: () {
            _onItemTapped(1);
          },
        ),
        ListTile(
          leading: const Icon(Icons.model_training),
          title: const Text("model"),
          selected: _selectedIndex == 0,
          onTap: () {
            _onItemTapped(2);
          },
        )
    ],
    
    )
  ),

  body: Center(
    child: _widgetOptions.elementAt(_selectedIndex),
  ),
    );
  }
}