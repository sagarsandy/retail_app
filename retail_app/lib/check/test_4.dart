import 'package:flutter/material.dart';
import 'package:retail_app/check/test_3.dart';

class Test4 extends StatefulWidget {
  const Test4({super.key});

  @override
  State<Test4> createState() => _Test4State();
}

class _Test4State extends State<Test4> {
  @override
  void initState() {
    debugPrint("Test4 initState called");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Test4 build called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test4 Page'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(bottom: 100),
            itemCount: 30,
            itemBuilder: (context, index) => ListTile(
              title: Text('Screen 4 Item ${index + 1}'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const BottomFlex(
              index: 3,
            ),
          ),
        ],
      ),
    );
  }
}
