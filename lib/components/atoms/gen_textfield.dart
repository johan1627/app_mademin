import 'package:app_mademin/components/misc/const_format.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatefulWidget {
  final String lable;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int length;
  final bool isPassword;
  final Function(String?) onChanged;
  final String hintText;
  final bool isReadOnly;

  const TextFieldCustom({
    super.key,
    required this.controller,
    required this.lable,
    required this.keyboardType,
    required this.length,
    required this.isPassword,
    required this.onChanged,
    this.hintText = "",
    this.isReadOnly = false,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  //
  bool visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        readOnly: widget.isReadOnly,
        onChanged: widget.onChanged,
        style: h3.copyWith(
          fontWeight: FontWeight.w600,
          color: widget.isReadOnly ? greyColor : Colors.black87,
          letterSpacing: 1.5,
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        maxLength: widget.length,
        obscureText: widget.isPassword ? visiblePassword : false,
        decoration: InputDecoration(
          // hint
          hintText: widget.hintText,
          hintStyle: footFont.copyWith(color: greyColor),
          counterText: "", // hide maxLength
          labelText: widget.lable,
          labelStyle: lableFont.copyWith(
            color: blackFlat,
            fontWeight: FontWeight.w400,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          suffixIcon: (widget.isPassword)
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      visiblePassword = !visiblePassword;
                    });
                  },
                  icon: Icon(
                    visiblePassword ? Icons.visibility_off : Icons.visibility,
                    color: blackLight,
                  ),
                )
              : (widget.isReadOnly)
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        widget.controller.clear();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 16.0,
                        color: greyColor,
                      ),
                    ),
          suffixIconColor: blackLight,
          // line
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}

class TextFieldIDR extends StatefulWidget {
  final String lable;
  final TextEditingController controller;
  final int length;
  final Function(String?) onChanged;
  final String hintText;
  final String prefixText;
  final bool readOnly;

  const TextFieldIDR({
    super.key,
    required this.controller,
    required this.lable,
    required this.length,
    required this.onChanged,
    this.hintText = "",
    this.prefixText = "IDR ",
    this.readOnly = false,
  });

  @override
  State<TextFieldIDR> createState() => _TextFieldIDRState();
}

class _TextFieldIDRState extends State<TextFieldIDR> {
  //
  bool visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: widget.onChanged,
        style: h4.copyWith(
          color: widget.readOnly ? Colors.black26 : Colors.black87,
          letterSpacing: 1.5,
        ),
        readOnly: widget.readOnly,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        maxLength: widget.length,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          CurrencyFormat()
        ],
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          // hint
          hintText: widget.hintText,
          hintStyle: footFont.copyWith(color: greyColor),
          counterText: "", // hide maxLength
          labelText: widget.lable,
          labelStyle: lableFont.copyWith(color: blackFlat),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          suffixIcon: IconButton(
            onPressed: () {
              if (widget.readOnly == false) {
                widget.controller.clear();
              }
            },
            icon: const Icon(
              Icons.close,
              size: 16.0,
              color: greyColor,
            ),
          ),
          suffixIconColor: blackLight,
          prefix: Text("${widget.prefixText} ", style: lableFont),
          // line
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
