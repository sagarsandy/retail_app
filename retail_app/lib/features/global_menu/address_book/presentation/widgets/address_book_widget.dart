import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import 'address_delete_dialog_widget.dart';
import 'address_form_dialog_widget.dart';

class AddressBookWidget extends StatelessWidget {
  const AddressBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: SSColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Address title',
                        style: Theme.of(context).textTheme.large(
                              SSColors.black,
                              fontWeight: FontWeightType.bold,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Visibility(
                        visible: true,
                        child: Icon(
                          Icons.check_box_outlined,
                          color: SSColors.transparent.action(),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          _handleUpdateAddress(context);
                        },
                        child: Icon(
                          Icons.edit_outlined,
                          color: SSColors.transparent.action(),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          _handleDeleteDialog(context);
                        },
                        child: Icon(
                          Icons.delete_outline,
                          color: SSColors.transparent.action(),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '1234 Street Name, City, State, ZIP',
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleUpdateAddress(context) {
    showDialog(
      context: context,
      builder: (context) => const AddressFormDialogWidget(
        isUpdate: true,
      ),
    );
  }

  void _handleDeleteDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AddressDeleteDialogWidget(
        onDelete: () async {},
      ),
    );
  }
}
