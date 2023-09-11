import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel character;
  const CharacterDetailsScreen({super.key, required this.character});

  Widget? buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 460.h,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        background: Image.network(
          character.image!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 16.sp,
          ),
        ),
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      endIndent: endIndent,
      height: 20.h,
      thickness: 2,
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar()!,
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(20.sp, 20.sp, 20.sp, 20.sp),
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("Gender : ", character.gender!),
                      buildDivider(252.w),
                      characterInfo("Status : ", character.status!),
                      buildDivider(256.w),
                      characterInfo("Species : ", character.species!),
                      buildDivider(247.w),
                      characterInfo("Origin : ", character.origin!.name!),
                      buildDivider(260.w),
                      characterInfo("Location : ", character.location!.name!),
                      buildDivider(242.w),
                      SizedBox(
                        height: 350.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Developed by :',
                            style: TextStyle(
                                color: MyColors.myWhite,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp),
                          ),
                          TextButton(
                            onPressed: () {
                              _launchUrl();
                            },
                            child: Text(
                              "Mohamed Mousa",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: MyColors.myYellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
