import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/theme/color_value.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool isPassword;
  final bool readOnly;
  final double borderRadius;

  const CustomTextFormField(
      {Key? key,
        required this.label,
        required this.controller,
        this.textInputType = TextInputType.text,
        this.validator,
        this.onTap,
        this.isPassword = false,
        this.readOnly = false,
        this.borderRadius = 8})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isPasswordNotVisible = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final provider = Provider.of<ThemeProvider>(context);

    return TextFormField(

      onTap: widget.onTap,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword ? _isPasswordNotVisible : false,
      autocorrect: !widget.isPassword,
      enableSuggestions: !widget.isPassword,
      style: textTheme.bodyText1!.copyWith(
        color:  Colors.black,
      ),
      cursorColor: ColorValue.BaseBlue,
      readOnly: widget.readOnly,
      decoration: InputDecoration(

        // contentPadding: EdgeInsets.symmetric(vertical: 40.0),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xff666666),

          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            width: 1.5,
            color: Color(0xff666666),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            width: 2,
            color: ColorValue.secondaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.redAccent,
          ),
        ),
        labelText: widget.label,
        labelStyle: textTheme.bodyText1!.copyWith(
          fontSize: 16
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
        suffixIcon: widget.isPassword
            ? IconButton(
          splashRadius: 30,
          onPressed: () {
            setState(() {
              _isPasswordNotVisible = !_isPasswordNotVisible;
            });
          },
          icon: _isPasswordNotVisible
              ? const Icon(
            Icons.visibility_off,
            color: ColorValue.greyColor,
          )
              : const Icon(
            Icons.visibility,
            color: ColorValue.greyColor,
          ),
        )
            : null,
      ),
    );
  }
}
