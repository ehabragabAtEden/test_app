// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:provider/provider.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/api/api_get_countries.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/helper/recruiter/sign_up_recruiter_helper.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/helper/seeker/sign_up_seeker_helper.dart';
// import 'package:iem_app/pages/auth_sign_up/view/widget/sheet_country_code.dart';
// import 'package:iem_app/provider/loading_provider.dart';
//
// class StateSelectCountryCode {
//   LoadingProviderClass loadingProviderClass=LoadingProviderClass();
//   SignUpSeekerHelper signUpSeekerHelper=SignUpSeekerHelper();
//   SignUpRecruiterHelper signUpRecruiterHelper=SignUpRecruiterHelper();
//   ApiGetLoginCountriesProvider apiGetCountriesProvider=ApiGetLoginCountriesProvider();
//
//   StateSelectCountryCode(BuildContext context) {
//     loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
//     signUpSeekerHelper = Provider.of<SignUpSeekerHelper>(context, listen: false);
//     signUpRecruiterHelper = Provider.of<SignUpRecruiterHelper>(context, listen: false);
//   }
//
//   chooseCountrySheet({required BuildContext context,})async {
//     TextEditingController sheetSearchController=TextEditingController();
//
//     showMaterialModalBottomSheet(
//       expand: true,
//       context: context,
//       backgroundColor: Colors.transparent,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(50),
//       ),
//       builder: (context) {
//         return WillPopScope(
//           onWillPop: ()async{
//             return true;
//           },
//           child: SheetCountryCodeWidget(
//             searchController:sheetSearchController,
//             submitOnTap:(){
//               Navigator.pop(context);
//             } ,
//             onChanged: (val)=>apiGetCountriesProvider.onSearchTextChanged(text: val,context: context),
//
//           ),
//         );
//       },
//     );
//     signUpSeekerHelper.phoneNumberController.clear();
//     signUpRecruiterHelper.phoneNumberController.clear();
//
//     await apiGetCountriesProvider.getCountriesResponse(isLogin: true ,context: context);
//   }
//
//
//
// }
