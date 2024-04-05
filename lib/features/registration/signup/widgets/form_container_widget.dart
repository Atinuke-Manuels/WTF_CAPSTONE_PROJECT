import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final String? errorMessage;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final dynamic initialValue;
  final bool readOnly; // Add readOnly parameter

  const FormContainerWidget({
    this.controller,
    this.isPasswordField,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.errorMessage,
    this.focusNode,
    this.nextFocusNode,
    this.initialValue,
    this.readOnly = false, // Initialize readOnly parameter
  });

  @override
  _FormContainerWidgetState createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: TextStyle(color: Colors.black),
            controller: widget.controller,
            keyboardType: widget.inputType,
            key: widget.fieldKey,
            obscureText: widget.isPasswordField == true ? _obscureText : false,
            onSaved: widget.onSaved,
            validator: widget.validator,
            onFieldSubmitted: (value) {
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              }
              if (widget.onFieldSubmitted != null) {
                widget.onFieldSubmitted!(value);
              }
            },
            focusNode: widget.focusNode,
            readOnly: widget.readOnly, // Set readOnly property
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.black45),
              labelText: widget.labelText,
              labelStyle: TextStyle(color: Colors.black),
              helperText: widget.errorMessage,
              helperStyle: TextStyle(color: Colors.red),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: widget.isPasswordField == true
                    ? Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _obscureText == false ? Colors.blue : Colors.grey,
                )
                    : Text(""),
              ),
            ),
            initialValue: widget.initialValue != null ? widget.initialValue.toString() : null,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

