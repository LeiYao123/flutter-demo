import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tablet/style/color.dart';

class RInput extends StatelessWidget {
  final bool? disabled;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? errorText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool autofocus;
  final bool readOnly;
  final TextAlign textAlign;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  // 正则限制输入框的输入
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  const RInput({
    super.key,
    this.disabled = false,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.controller,
    this.errorText,
    this.onSaved,
    this.initialValue,
    this.keyboardType,
    this.autofocus = false,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.focusNode,
    this.inputFormatters,
  });

  static Widget dollerIcon =
      const Icon(Icons.attach_money, color: RColor.light_common_32, size: 16);
  static Widget percentIcon =
      const Icon(Icons.percent, color: RColor.light_common_32, size: 16);

  Widget? _getIcon(String type) {
    if (type == 'prefix' && prefixIcon == null) return null;
    if (type == 'suffix' && suffixIcon == null) return null;

    return Container(
      margin: type == 'prefix'
          ? const EdgeInsets.only(left: 16, right: 8)
          : const EdgeInsets.only(left: 8, right: 16),
      child: type == 'prefix' ? prefixIcon : suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        enabled: !disabled!,
        autofocus: autofocus,
        readOnly: readOnly,
        obscureText: obscureText!,
        textAlign: textAlign,
        maxLength: maxLength,
        initialValue: initialValue,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        style: const TextStyle(
          color: RColor.light_text_heavy,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          filled: disabled,
          fillColor: RColor.light_common_16,
          errorText: errorText,
          prefixIcon: _getIcon('prefix'),
          suffixIcon: _getIcon('suffix'),
          prefixIconConstraints: const BoxConstraints(),
          suffixIconConstraints: const BoxConstraints(),
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: RColor.light_common_8),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: RColor.light_common_8),
          ),
        ),
      ),
    );
  }
}
