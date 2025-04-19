import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_colors.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';
import 'package:retail_app/core/presentation/widgets/ss_expansion_tile_widget.dart';

import '../../../../../app/theme/ss_core_font.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _showTitle = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: _showTitle
            ? Text("Hello World", style: const TextStyle(color: Colors.black))
            : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.pixels > 70 && !_showTitle) {
            setState(() => _showTitle = true);
          } else if (scrollNotification.metrics.pixels <= 70 && _showTitle) {
            setState(() => _showTitle = false);
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  // color: Colors.pink,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        "SS Sweet Magic",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 20,
                              ),
                              const Text("Auto nagar, Vijayawada"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                size: 16,
                              ),
                              const Text("20-30mnts"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text("Open: 7:00 AM - Close: 11:00 PM"),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 100,
                  color: Colors.cyan.shade50,
                ),
                const SizedBox(height: 16),
                SSExpansionTileWidget(
                  title: "Biryani(8)",
                  children: [
                    Container(
                      height: 140,
                      color: Colors.grey.shade50,
                      margin: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 140,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 4.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.square,
                                      size: 24,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      "Chicken Biryani, i will be cooking it soon!. Let's wait for my signal",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          "₹ 200",
                                          style: Theme.of(context)
                                              .textTheme
                                              .regular(
                                                SSColors.primary1,
                                                isStrikeThrough: true,
                                              ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          "₹199",
                                          style: Theme.of(context)
                                              .textTheme
                                              .extraLarge(
                                                SSColors.primary1,
                                                fontWeight: FontWeightType.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 180,
                              width: 140,
                              child: Stack(
                                children: [
                                  // Background Image
                                  Positioned.fill(
                                    child: Image.network(
                                      'https://w7.pngwing.com/pngs/520/887/png-transparent-biryani-thumbnail.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),

                                  // Semi-transparent mask to dim the image
                                  Positioned.fill(
                                    child: Container(
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                  ),

                                  // "Add" Button at Bottom Center
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      width: 70,
                                      height: 30,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Handle button press
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: SSColors
                                              .primary3, // Highlighted color
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          elevation: 6,
                                        ),
                                        child: const Text(
                                          'Add',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
