import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_app/app/theme/ss_colors.dart';

import '../app/router/ss_app_routes.dart';

class Test3 extends StatefulWidget {
  const Test3({super.key});

  @override
  State<Test3> createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  @override
  void initState() {
    debugPrint("Test3 initState called");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Test3 build called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test3 Page'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(bottom: 100),
            itemCount: 30,
            itemBuilder: (context, index) => ListTile(
              title: Text('Screen 3  ${index + 1}'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const BottomFlex(
              index: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingNavHomePage extends StatefulWidget {
  final int index;
  const FloatingNavHomePage({
    super.key,
    required this.index,
  });

  @override
  FloatingNavHomePageState createState() => FloatingNavHomePageState();
}

class FloatingNavHomePageState extends State<FloatingNavHomePage> {
  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.add_circle_outline,
    Icons.notifications_none,
    Icons.person_outline,
  ];

  final List<String> _labels = [
    'Home',
    'Search',
    'Add',
    'Alerts',
    'Profile',
  ];

  void _onItemTapped(int index) {
    debugPrint('click index=$index');
    final String location = SSAppRoutes.values[index].name;
    context.goNamed(
      location,
      extra: {
        "key1": "value1",
        "key2": "value2",
      },
    );
  }

  Widget _buildFloatingNavBar() {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 1, bottom: 30),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(48),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.85),
            blurRadius: 20,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          final isSelected = index == widget.index;
          return GestureDetector(
            onTap: () => _onItemTapped(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: isSelected ? 6 : 4),
              decoration: BoxDecoration(
                color: isSelected ? SSColors.primary1 : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    child: Icon(
                      _icons[index],
                      color:
                          isSelected ? SSColors.primary4 : SSColors.secondary1,
                      size: isSelected ? 30 : 22,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    style: TextStyle(
                      color:
                          isSelected ? SSColors.primary4 : SSColors.secondary1,
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    child: Text(_labels[index]),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFloatingNavBar();
    // return Scaffold(
    //   backgroundColor: Colors.pink.shade50.withOpacity(0.1),
    //   body: Center(
    //     child: Text(
    //       'Selected Tab: ${_labels[_selectedIndex]}',
    //       style: TextStyle(fontSize: 20),
    //     ),
    //   ),
    //   bottomNavigationBar: _buildFloatingNavBar(),
    // );
  }
}

class BottomFlex extends StatelessWidget {
  final int index;
  const BottomFlex({
    super.key,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingNavHomePage(
      index: index,
    );
    return ConvexAppBar(
      curveSize: 10,
      curve: Curves.easeInOutCirc,
      style: TabStyle.reactCircle,
      elevation: 4,
      backgroundColor: Colors.black.withOpacity(0.6),
      shadowColor: Colors.black54,
      activeColor: Colors.white,
      color: Colors.black,
      height: 60,
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.calendar_today, title: 'Order'),
        TabItem(icon: Icons.assessment, title: 'Cart'),
        TabItem(icon: Icons.list, title: 'Profile'),
        TabItem(icon: Icons.search, title: 'Search'),
      ],
      initialActiveIndex: index,
      onTap: (int i) {
        debugPrint('click index=$i');
        final String location = SSAppRoutes.values[i].name;
        context.goNamed(
          location,
          extra: {
            "key1": "value1",
            "key2": "value2",
          },
        );
      },
    );
  }
}
