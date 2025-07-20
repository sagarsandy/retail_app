import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_button_widget.dart';

class AddressFormDialogWidget extends StatefulWidget {
  final bool isUpdate;

  const AddressFormDialogWidget({
    super.key,
    this.isUpdate = false,
  });

  @override
  State<AddressFormDialogWidget> createState() =>
      _AddressFormDialogWidgetState();
}

class _AddressFormDialogWidgetState extends State<AddressFormDialogWidget> {
  bool _isLoading = false;
  final TextEditingController titleTEC = TextEditingController();
  final TextEditingController addressTEC = TextEditingController();

  Future<void> _handleSubmit(BuildContext context) async {
    final text = titleTEC.text.trim();
    if (text.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      if (mounted) {
        Navigator.pop(context);
        titleTEC.clear();
        addressTEC.clear();
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
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
        widget.isUpdate ? 'Update Address' : 'Add Address',
        style: Theme.of(context).textTheme.large(
              SSColors.black,
              fontWeight: FontWeightType.extraBold,
            ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleTEC,
            autofocus: true,
            enabled: !_isLoading,
            textCapitalization: TextCapitalization.words,
            onSubmitted: _isLoading ? null : (_) => _handleSubmit(context),
            decoration: InputDecoration(
              hintText: 'Home / Office / Other',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: SSColors.primary1F, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: SSColors.error1),
              ),
              counterText: '',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            maxLines: 4,
            controller: addressTEC,
            autofocus: true,
            enabled: !_isLoading,
            textCapitalization: TextCapitalization.words,
            onSubmitted: _isLoading ? null : (_) => _handleSubmit(context),
            decoration: InputDecoration(
              hintText: 'Enter full address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: SSColors.primary1F, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: SSColors.error1),
              ),
              counterText: '',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isLoading
              ? null
              : () {
                  titleTEC.clear();
                  addressTEC.clear();
                  Navigator.pop(context);
                },
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.medium(
                  _isLoading ? SSColors.grey1.withOpacity(0.5) : SSColors.grey1,
                ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: _isLoading ? 0 : 1,
              child: SSButtonWidget(
                elevation: 0,
                title: 'Save',
                onTap: () => _handleSubmit(context),
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
                      SSColors.transparent.action()),
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
