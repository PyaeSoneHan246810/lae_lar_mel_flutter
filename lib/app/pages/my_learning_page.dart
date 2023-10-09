import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import '../config/colors.dart';



class MyLearningPage extends StatefulWidget {
  const MyLearningPage({super.key});

  @override
  State<MyLearningPage> createState() => _MyLearningPageState();
}

class _MyLearningPageState extends State<MyLearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.pureWhiteColor,
        elevation: 2,
        toolbarHeight: 60,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'My Learning',
            style: AppFontStyle.headerPrimary,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'wishlistPage');
              },
              icon: const Icon(
                Icons.favorite,
                size: 28,
                color: AppColor.lightBlackColor,
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColor.pureWhiteColor,

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(      // (Blue<secondaryColor> Enrolled Container Box)
                            width: 170,
                            height: 97,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.secondaryColor,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.fact_check, size: 30, color: AppColor.pureWhiteColor),
                                    Text(
                                      "0 Course",
                                      style: AppFontStyle.subtitlePureWhite,
                                    ),
                                    Text(
                                      "Enrolled",
                                      style: AppFontStyle.bodyPureWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                           const SizedBox(height: 16),// Add  SizedBox widget to create space between the containers

                          Container(     // (Teal<primaryColor> Completed Container Box)
                            width: 170,
                            height: 97,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.primaryColor,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.school, size: 30, color: AppColor.pureWhiteColor),
                                    Text(
                                      "0 Course",
                                      style: AppFontStyle.subtitlePureWhite,
                                    ),
                                    Text(
                                      "Completed",
                                      style: AppFontStyle.bodyPureWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),


                    const SizedBox(width: 16),  // Add  SizedBox widget to create space between the containers

                    Container( //(Orange<featuredColor> Learned Today Container Box)
                      width: 160,
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.featuredColor,
                      ),

                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "0",
                                style: AppFontStyle.alertText1,
                              ),
                            ],
                          ),

                          Row(   //This row is for 'alarm icon' and 'minute text'.

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              Icon(Icons.alarm, size: 30, color: AppColor.pureWhiteColor),

                              SizedBox(width: 10),

                              Text(
                                "Minute",
                                style: AppFontStyle.subtitlePureWhite,
                              ),
                            ],
                          ),

                          SizedBox(height: 8),

                          Padding(
                            padding: EdgeInsets.only( bottom: 25,  ),
                            child:

                              Text(
                            "Learned Today",
                            style: AppFontStyle.bodyPureWhite,

                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),


                const SizedBox(height: 10),

                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only( top:1, bottom: 1,right: 156 ),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: Column( // Added a new Column widget to arrange the text widgets vertically
                          mainAxisAlignment: MainAxisAlignment.end, // Center the text widgets vertically
                          children: [
                            Text(
                              "Continue Learning",
                              style: AppFontStyle.title1OffBlack, // Customize the text style
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 30),

                SizedBox(
                  width: 280,
                  height: 210,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child:Image.asset(
                      'assets/images/empty_placeholder.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),


                const SizedBox(height: 34),

                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  width: 330,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),

                  ),

                  child:  const Center(

                    child: Text(
                      "You have no ongoing courses. What will you learn first?",
                      style:AppFontStyle.captionMediumOffBlack,
                    ),
                    ),
                  ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}