import 'package:cuentas_app/config/theme/coolors.dart';
import 'package:flutter/material.dart';

class DropdownButtonWidget<T> extends StatefulWidget {
  final List<T> options;

  const DropdownButtonWidget({
    super.key,
    required this.options,
  });

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidget<T>();
}

class _DropdownButtonWidget<T> extends State<DropdownButtonWidget<T>> {
  late T dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 44,
      decoration: BoxDecoration(
        color: Coolors.accent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<T>(
        value: dropdownValue,
        onChanged: (T? value) {
          setState(() {
            dropdownValue = value as T;
          });
        },
        elevation: 0,
        style: const TextStyle(color: Colors.white),
        iconEnabledColor: Coolors.dark,
        underline: const SizedBox(),
        selectedItemBuilder: (BuildContext context) {
          return widget.options.map((T value) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                dropdownValue.toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Coolors.dark,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          }).toList();
        },
        items: widget.options.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }
}
