import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class SSExpansionTileWidget extends StatefulWidget {
  final String title;
  final List<Widget> children;
  const SSExpansionTileWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  State<SSExpansionTileWidget> createState() => _SSExpansionTileWidgetState();
}

class _SSExpansionTileWidgetState extends State<SSExpansionTileWidget> {
  bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedPhysicalModel(
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeInOut,
      elevation: _isExpanded ? 8.0 : 2.0,
      shape: BoxShape.rectangle,
      shadowColor: Colors.black,
      color: SSColors.surfaceF,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: ListTile(
              title: Text(
                widget.title,
                style: Theme.of(context).textTheme.large(
                      SSColors.black,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
              trailing: Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2.0,
                vertical: 1.0,
              ),
              child: Column(
                children: widget.children,
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 150),
          ),
        ],
      ),
    );
  }
}
