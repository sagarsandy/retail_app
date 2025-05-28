import 'package:flutter/material.dart';
import 'package:retail_admin/core/presentation/widgets/admin_sidebar_menu_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SSColors.white,
        title: Text(
          'Admin Panel',
          style: Theme.of(context).textTheme.large(
                SSColors.black,
                fontWeight: FontWeightType.extraBold,
              ),
        ),
      ),
      drawer: AdminSideBarMenuWidget(
        selectedIndex: _selectedIndex,
        onCloseSidebar: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Text(
          'Welcome to Admin Panel',
          style: Theme.of(context).textTheme.large(
                SSColors.black,
                fontWeight: FontWeightType.extraBold,
              ),
        ),
      ),
    );
  }
}
