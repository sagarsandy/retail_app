import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _selectedIndex = 0;
  bool _isSidebarOpen = false;

  final List<Widget> _pages = const [
    Center(child: Text('Dashboard')),
    Center(child: Text('Orders')),
    Center(child: Text('Details')),
    Center(child: Text('Reviews')),
    Center(child: Text('Reports')),
    Center(child: Text('Notifications')),
  ];

  final List<String> _titles = [
    'Dashboard',
    'Orders',
    'Details',
    'Reviews',
    'Reports',
    'Notifications'
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        leading: isMobile
            ? IconButton(
                icon: Icon(_isSidebarOpen ? Icons.close : Icons.menu),
                onPressed: () {
                  setState(() {
                    _isSidebarOpen = !_isSidebarOpen;
                  });
                },
              )
            : null,
      ),
      body: Row(
        children: [
          if (!isMobile || _isSidebarOpen)
            Container(
              width: 250,
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Column(
                children: [
                  if (isMobile)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _isSidebarOpen = false;
                          });
                        },
                      ),
                    ),
                  Expanded(
                    child: ListView(
                      children: List.generate(
                        _titles.length,
                        (index) => ListTile(
                          leading: Icon(_getIcon(index)),
                          title: Text(_titles[index]),
                          selected: index == _selectedIndex,
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                              if (isMobile) _isSidebarOpen = false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.dashboard;
      case 1:
        return Icons.shopping_cart;
      case 2:
        return Icons.info;
      case 3:
        return Icons.reviews;
      case 4:
        return Icons.bar_chart;
      case 5:
        return Icons.notifications;
      default:
        return Icons.help;
    }
  }
}
