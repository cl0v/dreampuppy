import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry padding;
  final String label;
  final List<TextInputFormatter>? masks;

  CustomTextFieldWidget(
      {
    super.key,
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
    this.validator,
    this.label = "",
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0),
    this.masks
  });

  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ValueListenableBuilder<bool>(
          valueListenable: _isPasswordVisible,
          builder: (_, isPasswordVisible, __) {
            return TextFormField(
              inputFormatters: masks,
              validator: validator,
              style: isPasswordVisible
                  ? const TextStyle(
                      letterSpacing: 8,
                      fontWeight: FontWeight.bold,
                    )
                  : null,
              controller: controller,
              // Tabela verdade [v] representa visível e [f] representa campo senha
              // [r] representa resultado [!] representa que é impossível acontecer
              /*
                v    f    r
                F    T    T
                F    F    F
                T    T    F
                T    F    !
              */
              obscureText: !isPasswordVisible &&
                  isPasswordField, //vF && fT = fT | vF && fF = fF | vT && fT = tT | vT && fT = tF
              decoration: InputDecoration(
                label: Text(
                  label,
                ),
                labelStyle: const TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal
                ),
                errorText: null,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                suffixIcon: _buildSuffixIcon(
                  isPasswordField,
                  isPasswordVisible,
                  () => _isPasswordVisible.value = !_isPasswordVisible.value,
                ),
              ),
            );
          }),
    );
  }
}

Widget? _buildSuffixIcon(bool isPasswordField, bool visible, Function() onTap) {
  if (isPasswordField) {
    if (visible) {
      return IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.visibility_off),
      );
    }
    return IconButton(
      onPressed: onTap,
      icon: const Icon(Icons.remove_red_eye),
    );
  }
  return null;
}
