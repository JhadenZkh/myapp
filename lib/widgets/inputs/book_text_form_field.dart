import 'package:flutter/material.dart';

class BookTextFormField extends StatefulWidget {
  final String labelText;
  final String errorText;
  final void Function(String?) onSaved;
  final String? initialValue;

  const BookTextFormField({
    super.key,
    required this.labelText,
    required this.errorText,
    required this.onSaved,
    this.initialValue,
  });

  @override
  _BookTextFormFieldState createState() => _BookTextFormFieldState();
}

class _BookTextFormFieldState extends State<BookTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 16.0,
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        errorStyle: const TextStyle(
          fontSize: 15.0,
          height: 0.9,
        ),
        labelStyle: const TextStyle(color: Colors.grey),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return widget.errorText;
        }
        return null;
      },
      onSaved: widget.onSaved,
    );
  }
}
