import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardtype;
  final Function()? onChanged;
  final Function()? onSubmited;

  final TextEditingController? controller;
  final Function? onTap;

  const CustomTextField({
    super.key,
    this.initialValue,
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onSubmited,
    this.onTap,
    this.keyboardtype,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboardtype,
        initialValue: initialValue,
        //onChanged: onChanged!(),
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.amber, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.amber),
        ),
        style: const TextStyle(
          fontSize: 18,
          color: Colors.amber,
        ),
      ),
    );
  }
}
