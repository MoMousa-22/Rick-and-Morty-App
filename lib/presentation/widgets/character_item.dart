import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(10.sp, 10.sp, 10.sp, 10.sp),
      padding:  EdgeInsetsDirectional.all(4.sp),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charactersDetailsScreen,
            arguments: character),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${character.name}',
              style:  TextStyle(
                height: 1.3,
                fontSize: 15.sp,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: character.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              placeholder: 'assets/images/loading.gif',
              image: character.image!,
              fit: BoxFit.cover,
            )
                : Image.asset('assets/images/ss.png'),
          ),
        ),
      ),
    );
  }
}