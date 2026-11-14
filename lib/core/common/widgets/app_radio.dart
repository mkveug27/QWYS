import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

enum RadioSize { large, small }

class AppRadio<T> extends StatelessWidget {
  const AppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.text,
    this.size = RadioSize.small,
    this.onChanged,
  });

  final T value;
  final T? groupValue;
  final Widget? text;
  final RadioSize size;
  final ValueChanged<T>? onChanged;

  static const double _borderWidth = 1;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    final isEnabled = onChanged != null;

    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: isSelected,
      enabled: isEnabled,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: isEnabled ? () => onChanged!(value) : null,
        child: Row(
          spacing: xsPadding,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRadio(context, isSelected),
            if (text != null) Flexible(child: text!),
          ],
        ),
      ),
    );
  }

  Widget _buildRadio(BuildContext context, bool isSelected) {
    final colors = Theme.of(context).colors;

    return AnimatedContainer(
      width: _getSize(size),
      height: _getSize(size),
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      margin: const EdgeInsets.all(xsPadding),
      padding: const EdgeInsets.all(xsPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: _borderWidth,
          color:
              isSelected ? colors.surfacePrimaryExtra : colors.textIconDefault,
        ),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected ? colors.surfacePrimaryDefault : colors.transparent,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  double _getSize(RadioSize size) {
    return switch (size) {
      RadioSize.large => 20,
      RadioSize.small => 18,
    };
  }
}
