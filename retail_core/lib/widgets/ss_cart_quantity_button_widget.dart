import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class SSCartQuantityButtonWidget extends StatefulWidget {
  final String title;
  final bool isPrimary;
  final Color? primaryColor;
  final Function(int quantity)? onQuantityChanged;
  const SSCartQuantityButtonWidget({
    super.key,
    required this.title,
    this.primaryColor = SSColors.primary1F,
    this.onQuantityChanged,
    this.isPrimary = true,
  });

  @override
  State<SSCartQuantityButtonWidget> createState() =>
      _SSCartQuantityButtonWidgetState();
}

class _SSCartQuantityButtonWidgetState
    extends State<SSCartQuantityButtonWidget> {
  int _quantity = 0;

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
      widget.onQuantityChanged?.call(_quantity);
    }
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
    widget.onQuantityChanged?.call(_quantity);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: ElevatedButton(
        onPressed: _quantity == 0 ? _incrementQuantity : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isPrimary ? SSColors.actionM : SSColors.white,
          padding: EdgeInsets.zero,
          side: BorderSide(color: SSColors.actionM, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child:
            _quantity == 0
                ? Center(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.medium(
                      widget.isPrimary ? SSColors.white : SSColors.actionM,
                      fontWeight: FontWeightType.bold,
                    ),
                  ),
                )
                : Container(
                  decoration: BoxDecoration(
                    color: widget.isPrimary ? SSColors.actionM : SSColors.white,
                    border: Border.all(
                      color:
                          widget.isPrimary ? SSColors.white : SSColors.actionM,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          icon: Icon(
                            Icons.remove,
                            size: 16,
                            color:
                                widget.isPrimary
                                    ? SSColors.white
                                    : SSColors.actionM,
                          ),
                          onPressed: _decrementQuantity,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        child: Text(
                          _quantity.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.medium(
                            widget.isPrimary
                                ? SSColors.white
                                : SSColors.actionM,
                            fontWeight: FontWeightType.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          icon: Icon(
                            Icons.add,
                            size: 16,
                            color:
                                widget.isPrimary
                                    ? SSColors.white
                                    : SSColors.actionM,
                          ),
                          onPressed: _incrementQuantity,
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
