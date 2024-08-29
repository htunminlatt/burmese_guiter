import 'package:burmese_guiter/uitils/colors.dart';
import 'package:flutter/material.dart';

class DropdownListView extends StatefulWidget {
  const DropdownListView({super.key, required this.value});
  final Function(String) value;
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownListView> {
  String _selectedOption = 'all'; // Initial selected option

  // Options for the dropdown
  final List<String> _options = [
    'all',
    'Option 2',
    'Option 3',
    'Option 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: kDarkColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(blurRadius: 5.0, spreadRadius: 5.0, color: Colors.black12)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButton<String>(
          isExpanded: true,
          underline: Container(),
          selectedItemBuilder: (context) {
            return _options
                          .map((e) => Container(
                                alignment: Alignment.center,
                                child: Text(
                                  e,
                                  style:const TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList();
          },
          focusColor: kWhiteColor,
          iconEnabledColor: kWhiteColor,
          iconSize: 30,
          value: _selectedOption,
          onChanged: (newValue) {
            setState(() {
              _selectedOption = newValue ?? '';
              widget.value(newValue ?? '');
            });
          },
          items: _options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

