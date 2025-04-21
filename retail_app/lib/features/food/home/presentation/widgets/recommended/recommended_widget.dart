import 'package:flutter/material.dart';
import 'package:retail_app/features/food/home/presentation/widgets/recommended/recommended_list_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/title_widget.dart';

class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({super.key});

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: SizedBox(
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(title: 'Recommended for you'),
              SizedBox(height: 10),
              Expanded(child: RecommendedListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
