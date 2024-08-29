import 'package:burmese_guiter/uitils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double _minValue = 0;
  double _maxValue = 10000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          activeColor: kPrimaryColor,
          values: RangeValues(_minValue, _maxValue),
          min: 0.0,
          max: 10000.0,
          onChanged: (RangeValues values) {
            setState(() {
              _minValue = values.start;
              _maxValue = values.end;
            });
          },
        ),
        const SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_minValue.toInt()} KS',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              '${_maxValue.toInt()} Ks',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
