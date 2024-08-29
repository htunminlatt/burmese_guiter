import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/widgets/course_view.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

int _selectedIndex = 0;
List<String> categoriesTitleArray = ['All','Guiter','Piano','Drum',];


  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: false,
        title: Text(
          'Categories',
          style: TextStyle(color: kWhiteColor),
        ),
      ),
      body: Row(
        children: [
          Container(width: 80,color: kAppBarColor,
          child: ListView.builder(
            itemCount: categoriesTitleArray.length,
            itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: SizedBox(
                height: 80,
                width: 80,
                child: Column(children: [
                  Text(categoriesTitleArray[index],style: TextStyle(color: _selectedIndex == index ? kWhiteColor : kDarkGrayColor),)
                ],),
              ),
            );
          })),
          ),
          Expanded(
            child: Container(
              color: kDarkColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 250),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const CourseView(enrollOrNot: false,);
                      },
                      ),
              ),
            ),
          )
        ],
      ),
    );
    
  }
}
