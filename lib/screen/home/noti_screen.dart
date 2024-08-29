import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: false,
        title: const Text('Notification'),
        foregroundColor: kWhiteColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(onPressed: (){
            
            }, icon: Image.asset(kTranshLogo,width: 25,height: 25,)),
          )
        ],
      ),

      body: ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
        return Container(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          margin:const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 0),
          height: 80,
          decoration: BoxDecoration(
            color: kAppBarColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: kAppBarColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const[
                          BoxShadow(blurRadius: 5.0, spreadRadius: 5.0, color: Colors.black12)
                        ]
                      ),
                      child: Center(child: Image.asset(kMessageLogo,width: 24,height: 24,),),
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      SizedBox(
                        width: 150,
                        child: Text('successful purchase!',overflow: TextOverflow.ellipsis,softWrap: true,style: TextStyle(fontSize: kTextRegular,color: kWhiteColor),)),
                       const SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.timelapse,color: kDarkGrayColor,size: 12,),
                          const SizedBox(width: 3,),
                          Text('Just now',style: TextStyle(color: kDarkGrayColor,fontSize: kTextSmall),)
                        ],
                      )
                    ],)
                  ],
                ),
              ),

              Container(height: 16,width: 16,decoration: BoxDecoration(color: kSecondaryColor,shape: BoxShape.circle),)

            ],
          ),
        );
      })),
      
    );
  }
}
