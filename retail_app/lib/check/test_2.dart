import 'package:flutter/material.dart';
import 'package:retail_app/check/test_3.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  void initState() {
    debugPrint("Test2 initState called");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Test2 build called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test2 Page'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(bottom: 100),
            itemCount: 30,
            itemBuilder: (context, index) => ListTile(
              title: Text('Screen 2 Item ${index + 1}'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const BottomFlex(
              index: 1,
            ),
          ),
        ],
      ),
    );
  }
}
