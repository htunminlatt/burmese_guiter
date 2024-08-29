// ignore: file_names
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/widgets/custom_dropdown.dart';
import 'package:burmese_guiter/widgets/price_range.dart';
import 'package:flutter/material.dart';

class FilterBottomSheetView extends StatefulWidget {
  const FilterBottomSheetView({super.key});

  @override
  State<FilterBottomSheetView> createState() => _FilterBottomSheetViewState();
}

class _FilterBottomSheetViewState extends State<FilterBottomSheetView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: kAppBarColor,
                isScrollControlled: true,
                elevation: 0,
                context: context,
                builder: (context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20,),
      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Filter',style: TextStyle(color: kWhiteColor,fontSize: kTextRegular3x),),
                            IconButton(onPressed: (){}, icon: Icon(Icons.close,size: 20,color: kWhiteColor,))
                          ],
                        ),
                        Divider(color: kDarkGrayColor),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Price Range',
                          style: TextStyle(color: kWhiteColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: const PriceRangeSlider(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(color: kDarkGrayColor),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Instrument',
                                    style:
                                        TextStyle(color: kWhiteColor, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DropdownListView(
                                    value: (String value) {},
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 19,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Experience',
                                    style:
                                        TextStyle(color: kWhiteColor, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DropdownListView(
                                    value: (String value) {},
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(color: kDarkGrayColor),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: kWhiteColor)),
                                  child: Center(
                                    child: Text(
                                      'Reset',
                                      style: TextStyle(color: kWhiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 19,),
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: kWhiteColor),
                                child: Center(
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(color: kDarkColor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
      
                        const SizedBox(height: 20,)
                      ],
                    ),
                  );
                });
          },
          icon: Image.asset(
            kFilterLogo,
            width: 25,
            height: 25,
          )),
    );
  }
}
