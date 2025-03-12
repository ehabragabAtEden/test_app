import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/languages/model/languages_model.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';

class LanguageItemWidget extends StatelessWidget {
  final LanguageItemModel languageItemModel;
  final bool selected;
  final VoidCallback onTap;
  const LanguageItemWidget({super.key,required this.onTap,required this.languageItemModel,required this.selected,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.height*0.01,
          bottom: SizeConfig.height*0.01,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                languageItemModel.name,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorConfig().blackColor(1),fontWeight: FontWeight.w500,),
              ),
            ),

            VisibleWidget(
              visible: selected ,
              child: Icon(
                Icons.check,
                color: ColorConfig().primaryColor(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
