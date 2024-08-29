import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/widgets/course_view.dart';
import 'package:burmese_guiter/widgets/filterBottomsheet.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> array = [
    'Guiter',
    'Hello',
    'Welcome Guiter',
    'Welcome',
    'Guiter Tuner',
    'Welcome Home'
  ];
  List<String> filterArray = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar:
          AppBar(backgroundColor: kAppBarColor, foregroundColor: kWhiteColor),
      body: Stack(
        children: [
          Container(color: Colors.transparent,
          margin:const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            
            children: [
             const SizedBox(height: 80,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('8 products found',style: TextStyle(color: kWhiteColor),),
              const FilterBottomSheetView()
             ],),
             const SizedBox(height: 0,),
              Expanded(
                child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 21,
                  crossAxisSpacing: 21,
                  mainAxisExtent: 279),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CourseView(enrollOrNot: false,);
                  },
                  ),
              )
            ],
          ),),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 45,
                decoration: BoxDecoration(
                    color: kDark2Color,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          style: TextStyle(color: kWhiteColor),
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                filterArray = [];
                              } else {
                                filterArray = array
                                    .where((element) => element
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              }
                            });
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search courses',
                              hintStyle: TextStyle(color: kDarkGrayColor)),
                        ),
                      ),
                      Image.asset(
                        kSearchLogo,
                        width: 20,
                        height: 20,
                        color: kDarkGrayColor,
                      )
                    ],
                  ),
                ),
              ),
             filterArray.isEmpty ? Container() : Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20),
                  decoration: BoxDecoration(
                      color: filterArray.isEmpty
                          ? Colors.white
                          : kAppBarColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filterArray.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  controller.text = filterArray[index];
                                  filterArray.clear();
                                });
                              },
                              child: Text(
                                filterArray[index],
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: kTextRegular2x),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      })),
                ),
            ],
          ),
          
        ],
      ),
    );
  }
}
