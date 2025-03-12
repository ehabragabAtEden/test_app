// ignore_for_file: use_build_context_synchronously

import 'package:iem_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class CheckConnectionOnLunch {
  // static ApiGetAppLanguages apiGetAppLanguages=ApiGetAppLanguages();
  // static ApiAppPaginationConfig apiAppPaginationConfig=ApiAppPaginationConfig();
  // static ApiGetBarCategories apiGetBarCategories=ApiGetBarCategories();
  // static ApiGetHomeDynamicListViews apiGetHomeDynamicListViews=ApiGetHomeDynamicListViews();
  // static ApiGetAppSetting apiGetAppSetting=ApiGetAppSetting();
  // static ApiGetHomeCategories apiGetHomeCategories=ApiGetHomeCategories();
  // static ApiGeProducts apiGeProducts=ApiGeProducts();
  // static ApiGetHomeBrands apiGetHomeBrands=ApiGetHomeBrands();
  // static ApiGetCurrencies apiGetCurrencies=ApiGetCurrencies();
  // static ApiGetBrandsForFilter apiGetHomeBrandsForFilter=ApiGetBrandsForFilter();
  // static ApiGetSortList apiGetSortList=ApiGetSortList();
  // static ApiGetDiscountTagsForFilter apiGetDiscountTagsForFilter=ApiGetDiscountTagsForFilter();
  // static ApiGetCategoryForFilter apiGetCategoryForFilter=ApiGetCategoryForFilter();
  // static ApiGetCountries apiGetCountries=ApiGetCountries();


  static checkHaveConnectionOnLunch({required BuildContext context}) async {
    initializeDateFormatting();

    ColorConfig.appThemeColor = Provider.of<AppThemeProvider>(IemApp.navigatorKey.currentState!.overlay!.context, listen: false,);

    /// if have connection
    if (IemApp.navigatorKey.currentState!.overlay!.context.read<ConnectivityInitProvider>().hasConnection) {
     // await apiGetAppLanguages.getAppLanguagesResponse().then((value)async{
     //    if(apiGetAppLanguages.languagesModel.statusCode!=401) {
     //      IemApp.navigatorKey.currentState!.overlay!.context.read<LocalizationProvider>().fetchLocalization();
     //      IemApp.navigatorKey.currentState!.overlay!.context.read<AppThemeProvider>().getAppConfigResponse().then((value)async {
     //        apiAppPaginationConfig.getAppPaginationResponse(context: IemApp.navigatorKey.currentState!.overlay!.context).then((value) async{
     //        // apiGetHomeDynamicListViews.getHomeDynamicListView(isHome: true);
     //        apiGetAppSetting.getAppSettingResponse(context: IemApp.navigatorKey.currentState!.overlay!.context);
     //        // apiGetHomeCategories.getHomeCategories(isHome: true).then((value){
     //        //   StateCallInitProducts(context).callInitProducts(context: context,);
     //          // check if auth_login or not
     //          CheckVersionAvailability.checkAppVersionUpdate();
     //
     //        });
     //
     //        });
     //      });
     //      apiGetCurrencies.getCurrencies();
     //      // apiGetHomeBrands.resetPagination(context: context);
     //      // apiGetHomeBrands.getBrands(context: context, isFirstTime: true);
     //      apiGetSortList.getSortList(isFirstTime: true);
     //      // apiGetHomeBrandsForFilter.getBrands(context: context,firstTime: true);
     //      // apiGetDiscountTagsForFilter.getDiscountTags(context: context,isFirstTime: true);
     //      apiGetCategoryForFilter.getCategoriesAndSubCategory(firstTime: true);
     //    }
     //  });
     // apiGetCountries.getCountries(context: context, isLogin: true);
     // apiGetCountries.getCountries(context: context, isLogin: false);


    }

    /// no connection
    else {
      await IemApp.navigatorKey.currentState!.overlay!.context.read<SplashProvider>().setConnectionCheckedBefore(checked: true);
      // FlutterNativeSplash.remove();
    }
  }
}
