import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class AddCafePage extends StatefulWidget {
  const AddCafePage({super.key});

  @override
  State<AddCafePage> createState() => _AddCafePageState();
}

class _AddCafePageState extends State<AddCafePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.surface,
      appBar: AppBar(
        title: Text(
          'Add Cafe',
          style: Theme.of(context).textTheme.regular(SSColors.black),
        ),
      ),
      body: Container(
        height: 300,
        width: 300,
        color: Colors.cyan,
      ),
    );
  }
}
