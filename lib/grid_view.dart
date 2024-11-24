import 'package:flutter/material.dart';
import 'dart:math'; // Untuk menghasilkan warna acak

// ignore: camel_case_types
class List_View_Grid extends StatelessWidget {
  const List_View_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grid",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          Color randomTextColor =
              Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0);

          return Center(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Item $index',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: randomTextColor),
              ),
            ),
          );
        }),
      ),
    );
  }
}
