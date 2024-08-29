import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/widgets/custom_dropdown.dart';
import 'package:burmese_guiter/widgets/price_range.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kAppBarColor,
      elevation: 0,
      title: Text('Filter',style: TextStyle(color: kWhiteColor),),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          const SizedBox(height: 10,),
          Text('Price Range',style: TextStyle(color: kWhiteColor),),
          const SizedBox(height: 20,),
          SizedBox(height: 50,width: MediaQuery.of(context).size.width,child:const PriceRangeSlider(),),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Instrument',style: TextStyle(color: kWhiteColor,fontSize: 12),),
                  const SizedBox(height: 5,),
                  DropdownListView(value: (String value) {  },)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Experience',style: TextStyle(color: kWhiteColor,fontSize: 12),),
                  const SizedBox(height: 5,),
                  DropdownListView(value: (String value) {  },)
                ],
              )
            ],
          ),
          const SizedBox(height: 20,),
          const Divider(),
        ],
      ),
      actions: <Widget>[
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kWhiteColor)
              ),
              child:  Center(child: Text('Reset',style: TextStyle(color: kWhiteColor),),),
            ),
          ),
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kWhiteColor
            ),
            child:  Center(child: Text('Apply',style: TextStyle(color: kDarkColor),),),
          )
        ],
       )
      ],
    );
  }
}
