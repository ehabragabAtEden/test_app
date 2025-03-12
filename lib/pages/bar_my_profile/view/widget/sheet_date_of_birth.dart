// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/widgets/buttons.dart';
// import 'package:iem_app/widgets/custom_date_picker.dart';
//
// class SheetDateOfBirth extends StatelessWidget {
//   final Function(DateTime date) onDateTimeChanged;
//   final VoidCallback pickOnTap;
//   final DateTime maxDate;
//   final DateTime initialDate;
//   final bool isEditInfoBirthDate;
//   const SheetDateOfBirth({Key? key,required this.initialDate,required this.onDateTimeChanged,required this.pickOnTap,required this.maxDate,this.isEditInfoBirthDate=false,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//           color: ColorConfig().cardWhiteColor(1),
//           borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConfig.height*0.02),topRight:Radius.circular(SizeConfig.height*0.02) ),
//         ),
//         height: SizeConfig.height/2.3,
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal:SizeConfig.height*0.02 ),
//           child: Column(
//             children: [
//               SizedBox(height: SizeConfig.height*0.02,),
//
//               // app bar
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//
//                   SizedBox(
//                     height:SizeConfig.height*0.04 ,
//                     width: SizeConfig.height*0.04,
//                     child: InkWell(
//                       onTap: ()=>Navigator.pop(context),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
//                           border: Border.all(
//                             color: ColorConfig().buttonGrey3Color(0.3),
//                             width: 0.5,
//                           ),
//                         ),
//                         child: Icon(
//                           Icons.clear,
//                           size: SizeConfig.height*0.022 ,
//                           color: ColorConfig().iconLightBlueColor(1),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   Text(
//                     AppLocalizations.of(context)!.translate("pickDateOfBirth").toString(),
//                     style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorConfig().fontNavyColor(1),fontWeight: FontWeight.w600),
//                   ),
//
//                   SizedBox(width: SizeConfig.height*0.045,),
//                 ],
//               ),
//
//               Expanded(
//                 child: CupertinoTheme(
//                   data: CupertinoThemeData(
//                     textTheme: CupertinoTextThemeData(
//                       dateTimePickerTextStyle:Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorConfig().fontBlackColor(1),fontWeight: FontWeight.w500),
//                       textStyle:Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorConfig().fontNavyColor(0.7),fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   child: CustomCupertinoDatePicker(
//                     mode: CustomCupertinoDatePickerMode.date,
//                     initialDateTime: initialDate,
//                     withDays: true,
//                     minimumYear: DateTime.now().year-80,
//                     minimumDate:isEditInfoBirthDate?null: DateTime.now().copyWith(year: DateTime.now().year-80,day:DateTime.now().day+1 ,hour: initialDate.hour,minute: initialDate.minute,second:initialDate.second,microsecond: initialDate.microsecond,millisecond: initialDate.millisecond, ),
//                     maximumDate: maxDate,
//                     onDateTimeChanged:onDateTimeChanged,
//                     maximumYear: maxDate.year,
//                     dateOrder:DatePickerDateOrder.dmy ,
//                   ),
//                 ),
//               ),
//               /// pick button
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal:SizeConfig.height*0.025 ),
//                 child: CustomMainButton(
//                   onPress: pickOnTap,
//                   buttonText: "pickButton",
//                   backgroundColor: ColorConfig().buttonLightBlueColor(1),
//                   onPressColor: ColorConfig().buttonNavyColor(0.1),
//                   borderColor: ColorConfig().buttonBlueColor(1),
//                   borderWidth:0 ,
//                   elevation: 1,
//                   shadowColor: ColorConfig().buttonBlueColor(0.1),
//                   enabled: true,
//                   style:Theme.of(context).textTheme.displayMedium!.copyWith(
//                     color:ColorConfig().fontWhiteColor(1),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               SizedBox(height: SizeConfig.height*0.02,),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
