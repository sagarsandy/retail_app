import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_app/features/global_menu/address_book/presentation/widgets/address_book_widget.dart';
import 'package:retail_app/features/global_menu/address_book/presentation/widgets/address_form_dialog_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';

class AddressBookPage extends StatelessWidget {
  const AddressBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.transparent.surface(),
      appBar: SSAppBarWidget(
        showTitle: true,
        title: 'Address Book',
        showLeadingIcon: true,
        trailingWidget: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              _handleAddAddress(context);
            },
            child: const Icon(
              Icons.add,
              color: SSColors.black,
              size: 24,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const AddressBookWidget();
        },
      ),
    );
  }

  void _handleAddAddress(context) {
    showDialog(
      context: context,
      builder: (context) => const AddressFormDialogWidget(),
    );
  }
}
