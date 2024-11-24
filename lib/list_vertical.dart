import 'package:flutter/material.dart';

class List_view_Vertical extends StatelessWidget {
  const List_view_Vertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vertical",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Semarang"),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("085678901234"),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text("Universitas PGRI Semarang"),
          )
        ],
      ),
    );
  }
}
