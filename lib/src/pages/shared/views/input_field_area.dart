import 'package:flutter/material.dart';

class InputFieldArea extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final String lable;
  final TextInputType textInputType;
  final IconData icon;
  final int maxLength;

  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  const InputFieldArea({
    required final this.onChanged,
    required final this.hint,
    required final this.icon,
    required final this.lable,
    required final this.controller,
    required final this.maxLength,
    required final this.validator,
    required final this.textInputType,
  });
  @override
  _InputFieldAreaState createState() => _InputFieldAreaState();
}

class _InputFieldAreaState extends State<InputFieldArea> {
  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        maxLength: widget.maxLength,
        controller: widget.controller,
        onChanged: widget.onChanged,
        keyboardType: widget.textInputType,
        autofocus: false,
        validator: widget.validator,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: widget.lable,
            icon: Icon(
              widget.icon,
              color: Colors.blue,
            ),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            )),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)),
            errorStyle: const TextStyle(color: Colors.red),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            hintText: widget.hint,
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
            contentPadding:
                const EdgeInsets.only(top: 15, right: 0, bottom: 20, left: 5)),
      ),
    );
  }
}
