import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_button_widget.dart';

class AddressDeleteDialogWidget extends StatefulWidget {
  final Future<void> Function() onDelete;

  const AddressDeleteDialogWidget({
    super.key,
    required this.onDelete,
  });

  @override
  State<AddressDeleteDialogWidget> createState() =>
      _AddressDeleteDialogWidgetState();
}

class _AddressDeleteDialogWidgetState extends State<AddressDeleteDialogWidget> {
  bool _isLoading = false;
  String? _error;

  Future<void> _handleDelete() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await widget.onDelete();
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Failed to delete address. Please try again.';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        'Delete Address?',
        style: Theme.of(context).textTheme.large(
              SSColors.black,
              fontWeight: FontWeightType.extraBold,
            ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you sure you want to delete?',
            style: Theme.of(context).textTheme.medium(SSColors.black),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              style: Theme.of(context).textTheme.small(SSColors.error1),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.medium(SSColors.grey1),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: _isLoading ? 0 : 1,
              child: SSButtonWidget(
                elevation: 0,
                title: 'Delete',
                onTap: _handleDelete,
                primaryColor: SSColors.transparent.action(),
              ),
            ),
            if (_isLoading)
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    SSColors.transparent.action(),
                  ),
                ),
              ),
          ],
        ),
      ],
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
    );
  }
}
