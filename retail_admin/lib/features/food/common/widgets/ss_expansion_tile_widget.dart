import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_admin/core/constants/ss_dimensions.dart';

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
      elevation: _isExpanded ? SSDimensions.spacingM : SSDimensions.spacingXXS,
      shape: BoxShape.rectangle,
      shadowColor: Colors.black,
      color: _isExpanded ? SSColors.surface : SSColors.white,
      borderRadius: BorderRadius.circular(SSDimensions.borderRadiusM),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _isExpanded ? SSColors.action : Colors.transparent,
            width: 0.25,
          ),
          borderRadius: BorderRadius.circular(SSDimensions.borderRadiusM),
        ),
        child: Column(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: ListTile(
                tileColor:
                    _isExpanded ? SSColors.surface.withOpacity(0.1) : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(SSDimensions.borderRadiusM),
                    bottom: Radius.circular(
                        _isExpanded ? 0 : SSDimensions.borderRadiusM),
                  ),
                ),
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.large(
                        SSColors.black,
                        fontWeight: FontWeightType.bold,
                      ),
                ),
                trailing: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: _isExpanded ? SSColors.action : SSColors.black,
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
                  horizontal: SSDimensions.spacingXXS,
                  vertical: SSDimensions.spacingXXS / 2,
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
      ),
    );
  }
}
