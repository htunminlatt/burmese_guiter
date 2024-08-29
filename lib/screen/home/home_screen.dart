import 'package:burmese_guiter/data/models/course_catetory_response.dart';
import 'package:burmese_guiter/network/home/home_cubit.dart';
import 'package:burmese_guiter/repository/app_repository.dart';
import 'package:burmese_guiter/screen/courses/course_detail.dart';
import 'package:burmese_guiter/screen/home/category_screen.dart';
import 'package:burmese_guiter/screen/home/search_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/uitils/toast_service.dart';
import 'package:burmese_guiter/widgets/app_loading.dart';
import 'package:burmese_guiter/widgets/appbar.dart';
import 'package:burmese_guiter/widgets/cache_image_url.dart';
import 'package:burmese_guiter/widgets/course_view.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryLists> categoryLists = [];

    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(AppRepository()),
      child: Scaffold(
        backgroundColor: kDarkColor,
        appBar: customAppBar('Home', context, true),
        body: BlocBuilder<HomeCubit, HomeState>(
          bloc: HomeCubit(AppRepository())..getCategoryLists(),
          builder: (context, state) {
            if (state is LoadingState) {
               return appLoadingWidget();
            }

            if (state is CategorySuccessState) {
              categoryLists = state.categoryLists;
            }

            if (state is FailState) {
              Future.delayed(Duration.zero,
                  () => ToastService.warningToast('Check your connection!'));
            }

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const SliverToBoxAdapter(child: Header()),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                  ),
                ),

                //category
                SliverToBoxAdapter(
                  child: CategoryView(
                    categoryLists: categoryLists,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Courses',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: kTextSize28),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),

                //courses
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 21,
                              crossAxisSpacing: 21,
                              mainAxisExtent: 279),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            PageNavigator(ctx: context)
                                .nextPage(page: const CourseDetailScreen());
                          },
                          child: const CourseView(enrollOrNot: false,),
                        );
                      }),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

//header
class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

//header
class _HeaderState extends State<Header> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> carouselSliderarray = [
      kCarouselImage,
      kCarouselImage,
      kCarouselImage,
      kCarouselImage,
      kCarouselImage
    ];
    CarouselSliderController indicatorController = CarouselSliderController();
    return Column(
      children: [
        //header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 45,
          decoration: BoxDecoration(
              color: kDark2Color, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    style: TextStyle(color: kWhiteColor),
                    onTap: () {
                      PageNavigator(ctx: context)
                          .nextPage(page: const SearchScreen());
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

        const SizedBox(
          height: 10,
        ),
        //coursel
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            SizedBox(
              height: 260,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                carouselController: indicatorController,
                options: CarouselOptions(
                  autoPlay: true,
                  height: 260.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: carouselSliderarray.map((imageString) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: kDarkGrayColor),
                        child: Image.asset(
                          imageString,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Guiter Course by ***',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '50,000 MMK',
                    style: TextStyle(
                        color: kSecondaryColor, fontSize: kTextRegular3x),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: -15,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: carouselSliderarray.asMap().entries.map((value) {
                    return GestureDetector(
                      onTap: () {
                        indicatorController.animateToPage(value.key);
                      },
                      child: Container(
                        width: _currentIndex == value.key ? 15 : 5,
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _currentIndex == value.key
                                ? kPrimaryColor
                                : kDarkGrayColor),
                      ),
                    );
                  }).toList(),
                ))
          ],
        )
      ],
    );
  }
}

//category
class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryLists});
  final List<CategoryLists> categoryLists;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: kTextSize28),
                ),
                InkWell(
                  onTap: () {
                    PageNavigator(ctx: context)
                        .nextPage(page: const CategoryScreen());
                  },
                  child: Row(
                    children: [
                      Text(
                        'see all',
                        style: TextStyle(
                            color: kWhiteColor, fontSize: kTextRegular),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Image.asset(
                        kArrowNext,
                        color: kWhiteColor,
                        width: 12,
                        height: 12,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      categoryLists.isEmpty ? 1 : categoryLists.length + 1,
                  itemBuilder: ((context, index) {
                    if (index == 0) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 90,
                        height: 78,
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 30.0,
                                  width: 30.0,
                                  child: cacheImage(
                                      'https://icons.veryicon.com/png/o/miscellaneous/fangshan-design_icon/category-18.png',
                                      24.0,
                                      24.0,
                                      kSecondaryColor)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'All',
                                style: TextStyle(
                                    color: kSecondaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    index -= 1;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 90,
                      height: 78,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 30,
                                width: 30,
                                child: cacheImage(
                                    categoryLists[index].logo ?? '',
                                    24.0,
                                    24.0,
                                    kSecondaryColor)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              categoryLists[index].nameEng ?? '',
                              textAlign: TextAlign.center,
                              
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  })))
        ],
      ),
    );
  }
}
