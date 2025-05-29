import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';

class SSDropdownWidget<T> extends StatelessWidget {
  final String title;
  final String hint;
  final T? value;
  final List<T> items;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;
  final bool isRequired;
  final double? height;

  const SSDropdownWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.value,
    required this.items,
    required this.getLabel,
    required this.onChanged,
    this.isRequired = false,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: SizedBox(
        height: height,
        child: DropdownButtonFormField<T>(
          isExpanded: true,
          value: value,
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          icon: const Icon(Icons.arrow_drop_down),
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                getLabel(item),
                style: const TextStyle(fontSize: 14),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(8.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SSColors.primary1, width: 2.0),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SSColors.error1),
            ),
          ),
          validator: (value) {
            if (value == null && isRequired) {
              return 'Please select $title';
            }
            return null;
          },
          selectedItemBuilder: (BuildContext context) {
            return items.map<Widget>((T item) {
              return Container(
                alignment: Alignment.centerLeft,
                constraints: const BoxConstraints(minWidth: 100),
                child: Text(
                  getLabel(item),
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
