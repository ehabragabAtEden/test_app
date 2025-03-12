// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:iem_app/helpers/app_localizations.dart';
// import 'package:iem_app/helpers/app_size_config.dart';
// import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/api/api_get_countries.dart';
// import 'package:iem_app/pages/auth_sign_up/view/widget/country_item_widget.dart';
// import 'package:iem_app/service/api_handler/api_state.dart';
// import 'package:iem_app/widgets/api_return_error_widget.dart';
// import 'package:iem_app/widgets/connection_error_widget.dart';
// import 'package:iem_app/widgets/custom_fields_widget.dart';
// import 'package:iem_app/widgets/loading_widget.dart';
//
// class SheetCountryCodeWidget extends StatelessWidget {
//   final TextEditingController searchController ;
//   final void Function() submitOnTap;
//   final Function(String val) onChanged;
//
//   const SheetCountryCodeWidget({Key? key,required this.searchController,required this.submitOnTap,required this.onChanged,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ApiGetLoginCountriesProvider apiCountriesController = ApiGetLoginCountriesProvider();
//
//     return Consumer2<HelperOldCandidateSearch,GeneralApiState>(
//       builder: (context, provider,provider2, child) {
//         return Column(
//           children: [
//             SizedBox(
//               height: SizeConfig.height*0.3,
//               width: SizeConfig.width,
//               child: GestureDetector(
//                 onTap: (){
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: ColorConfig().cardWhiteColor(1),
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConfig.height*0.02),topRight:Radius.circular(SizeConfig.height*0.02) ),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.02),
//
//                 width: SizeConfig.width,
//                 child: SafeArea(
//                   top: false,
//                   child: Builder(
//                     builder: (context) {
//                       if(apiCountriesController.isWaiting){
//                         return const Center(child: LoadingAnimationWidget());
//                       }
//                       if(apiCountriesController.hasError){
//                         return ErrorMsgWidget(errorMsg:apiCountriesController.error.toString(),);
//                       }
//                       if(apiCountriesController.connectionError){
//                         return ConnectionErrorWidget(
//                           marginTop: SizeConfig.height*0.0,
//                           tryAgainOnTap: ()async{
//                             await apiCountriesController.getCountriesResponse(isLogin: true,context: context);
//                           },
//                         );
//                       }
//
//                       if(apiCountriesController.hasData){
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: SizeConfig.height*0.02,),
//
//                             // app bar
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   AppLocalizations.of(context)!.translate("selectCountry").toString(),
//                                   style: Theme.of(context).textTheme.displayMedium!.copyWith(color: ColorConfig().fontNavyColor(1),fontWeight: FontWeight.w600),
//                                 ),
//                               ],
//                             ),
//
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   SizedBox(height: SizeConfig.height*0.03,),
//                                   // search field
//                                   Container(
//                                     padding:EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.00463),
//                                     child: Center(
//                                       child: CustomLoginSearchField(
//                                         onTap: (){},
//                                         onSubmitted: (val){
//                                           FocusScope.of(context).requestFocus( FocusNode());
//                                         },
//                                         onEditingComplete: (){},
//                                         onChanged: onChanged,
//                                         controller: searchController,
//                                         textInputAction: TextInputAction.done,
//                                         hintText: AppLocalizations.of(context)!.translate('searchInCountries').toString(),
//                                         enabled: true,
//                                         autofocus: false,
//                                         showCloseIcon: searchController.text.isNotEmpty,
//                                         iconOnTap: (){},
//                                       ),
//                                     ),
//                                   ),
//
//                                   // country list
//                                   Expanded(
//                                     child: Container(
//                                       padding:EdgeInsets.only(top: SizeConfig.height*0.0),
//                                       child: buildCountriesListWidget(
//                                         context: context,
//                                         showSearchList: apiCountriesController.searchResultList.isNotEmpty||searchController.text.isNotEmpty,
//                                         noResult:apiCountriesController.searchResultList.isEmpty&&searchController.text.isNotEmpty,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                           ],
//                         );
//                       }
//
//                       return Container();
//
//                     }
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget buildCountriesListWidget({required BuildContext context,required bool showSearchList,required bool noResult}){
//     final apiCountriesController = ApiGetLoginCountriesProvider();
//
//     if(showSearchList){
//       /// this filtered list search result
//       return ListView.separated(
//         itemCount: apiCountriesController.searchResultList.length,
//         scrollDirection: Axis.vertical,
//         physics: const BouncingScrollPhysics(),
//         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//         padding: EdgeInsets.only(left: SizeConfig.height * 0.00463,right:SizeConfig.height * 0.00463,top: SizeConfig.height*0.02,bottom:  SizeConfig.height*0.11),
//         itemBuilder: (context, index){
//           return CountryItemWidget(
//             onPress: (){
//               apiCountriesController.selectOnItem(newBoolean: !apiCountriesController.searchResultList[index].selected, index:index,isSearch: true,context: context);
//             },
//             name: apiCountriesController.searchResultList[index].name,
//             logoImage: apiCountriesController.searchResultList[index].image,
//             countryCode: apiCountriesController.searchResultList[index].code,
//             selected: apiCountriesController.searchResultList[index].selected,
//           );
//         },
//         separatorBuilder: (context, index){
//           return const Divider();
//         },
//       );
//     }
//
//     else if(noResult){
//       return const Center();
//     }
//
//     return ListView.separated(
//       /// this all country list
//
//       itemCount: apiCountriesController.allItemsList.length,
//       physics: const BouncingScrollPhysics(),
//       keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//       padding: EdgeInsets.only(left: SizeConfig.height * 0.00463,right:SizeConfig.height * 0.00463,top: SizeConfig.height*0.02,bottom:  SizeConfig.height*0.11),
//       itemBuilder: (context, index){
//         return CountryItemWidget(
//           onPress: (){
//             apiCountriesController.selectOnItem(newBoolean: !apiCountriesController.allItemsList[index].selected, index:index,isSearch: false ,context:context );
//           },
//           name: apiCountriesController.allItemsList[index].name,
//           logoImage: apiCountriesController.allItemsList[index].image,
//           countryCode: apiCountriesController.allItemsList[index].code,
//           selected: apiCountriesController.allItemsList[index].selected,
//         );
//       },
//       separatorBuilder: (context, index){
//         return const Divider();
//       },
//     );
//   }
// }
