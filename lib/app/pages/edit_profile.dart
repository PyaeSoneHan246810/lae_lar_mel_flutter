import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Edit Profile',
          style: AppFontStyle.headerPrimary,),
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: AppColor.primaryColor,
                    child: ClipOval(
                        child: Image.asset('assets/images/profile_placeholder.jpg',
                          height: 140,
                          width: 140,)
                    ),
                  ),
                ),
              ),
              const Positioned(
                right: 130,
                top: 20,
                child: Icon(Icons.edit,
                  size: 35,
                color: AppColor.primaryColor,),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Text('Username',
            style: AppFontStyle.captionBigOffBlack,),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: SizedBox(
              width: 380,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  filled: true,
                  fillColor: AppColor.greyColor,
                  alignLabelWithHint: true,
                  hintText: "Pyae Son Han",
                  hintStyle: AppFontStyle.inputText,
                  )
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Text('Email',
              style: AppFontStyle.captionBigOffBlack,),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: SizedBox(
              width: 380,
              child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: AppColor.greyColor,
                    alignLabelWithHint: true,
                    hintText: "Add your email",
                    hintStyle: AppFontStyle.inputHintText,
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 360,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.primaryColor,
                  ),
                  child:const Text('Save',
                  style: AppFontStyle.buttonNavTextPureWhite,
                  ),),
                ),
            ),
            ),
        ],
      ),
    );
  }
}
