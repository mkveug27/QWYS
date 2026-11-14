import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qwys/core/core.dart';

enum AppInputColor { primary, secondary }

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.autoFocus = false,
    this.errorText,
    this.validator,
    this.title,
    this.hintText,
    this.helperText,
    this.prefix,
    this.prefixText,
    this.prefixIcon,
    this.prefixIconPress,
    this.suffix,
    this.suffixText,
    this.suffixIcon,
    this.suffixIconPress,
    this.floatingLabelBehavior,
    this.color = AppInputColor.primary,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.readOnly = false,
    this.enabled = true,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
  });

  // Controller and initial value
  final TextEditingController? controller;
  final String? initialValue;

  // Focus
  final FocusNode? focusNode;
  final bool autoFocus;

  // Validation
  final String? errorText;
  final FormFieldValidator<String>? validator;

  // Decoration
  final String? title;
  final String? hintText;
  final Text? helperText;
  final Widget? prefix;
  final String? prefixText;
  final IconData? prefixIcon;
  final VoidCallback? prefixIconPress;
  final Widget? suffix;
  final String? suffixText;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconPress;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final AppInputColor color;

  // Input configuration
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  // State
  final bool readOnly;
  final bool enabled;

  // Callbacks
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;

  static const double _iconSize = 24;
  static const double _cursorWidth = 1.5;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        TextFormField(
          // Controller and initial value
          controller: controller,
          initialValue: controller == null ? initialValue : null,

          // Focus
          focusNode: focusNode,
          autofocus: autoFocus,

          // Validation
          forceErrorText: errorText,
          validator: validator,
          errorBuilder: (context, error) {
            return Text(
              error,
              style: textTheme.bodySmall?.copyWith(
                color: colors.textIconCritical,
              ),
            );
          },

          // Decoration
          decoration: InputDecoration(
            floatingLabelBehavior: floatingLabelBehavior ??
                (title == null || maxLines > 1
                    ? FloatingLabelBehavior.always
                    : FloatingLabelBehavior.auto),
            contentPadding: EdgeInsets.symmetric(
              horizontal: mPadding,
              vertical: title == null ? mPadding : sPadding,
            ),
            fillColor: color == AppInputColor.primary
                ? colors.surfaceSecondaryDefault
                : colors.surfaceDefault,
            labelText: title,
            hintText: hintText,
            prefix: prefix,
            prefixText: prefixText,
            prefixIcon: prefixIcon != null
                ? GestureDetector(
                    onTap: prefixIconPress,
                    child: Icon(prefixIcon, size: _iconSize),
                  )
                : null,
            suffix: suffix,
            suffixText: suffixText,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      suffixIconPress?.call();
                    },
                    child: Icon(suffixIcon, size: _iconSize),
                  )
                : null,
          ),

          // Input configuration
          keyboardType: keyboardType ??
              (maxLines > 1 ? TextInputType.multiline : TextInputType.text),
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,

          // State
          readOnly: readOnly,
          enabled: enabled,

          // Callbacks
          onChanged: onChanged,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),

          // Cursor
          cursorWidth: _cursorWidth,
          cursorColor: colors.textIconPrimaryDefault,
          cursorErrorColor: colors.textIconPrimaryDefault,

          // Text style
          style: textTheme.bodyMedium?.copyWith(
            color: enabled
                ? colors.textIconDefault
                : colors.textIconSecondaryDefault,
          ),
        ),
        if (helperText != null) helperText!,
      ],
    );
  }
}
