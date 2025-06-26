import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class CategoriesMWidget extends StatefulWidget {
  const CategoriesMWidget({super.key});

  @override
  State<CategoriesMWidget> createState() => _CategoriesMWidgetState();
}

class _CategoriesMWidgetState extends State<CategoriesMWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: MediaQuery.of(context).size.height,
      color: SSColors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: SSColors.primary1M.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://m.media-amazon.com/images/I/91Lj2AJXfOL._AC_UF1000,1000_QL80_.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4), // Spacer
                    Text(
                      "martCa and new one",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.small(
                            SSColors.black,
                            fontWeight: selectedIndex == index
                                ? FontWeightType.bold
                                : FontWeightType.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
