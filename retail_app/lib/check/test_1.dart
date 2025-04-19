import 'package:flutter/material.dart';
import 'package:retail_app/check/test_3.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  void initState() {
    debugPrint("Test1 initState called");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Test1 build called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test1 Page'),
      ),
      body: Stack(
        children: [
          ListView.builder(
              padding: EdgeInsets.only(bottom: 100),
              itemCount: 30,
              itemBuilder: (context, index) => ListTile(
                title: Text('Screen 1  Item ${index + 1}'),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const BottomFlex(
              index: 0,
            ),
          ),
        ],
      ),
    );
  }
}
