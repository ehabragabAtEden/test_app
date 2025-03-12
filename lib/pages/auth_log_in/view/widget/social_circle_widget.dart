import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialCircleWidget extends StatelessWidget {
  final String image;
  final VoidCallback onPress;
  const SocialCircleWidget({
    Key? key,
    required this.image,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: SizeConfig.height * .042,
        width: SizeConfig.height * .042,
        decoration: BoxDecoration(
          color: ColorConfig().primaryColor(1),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
