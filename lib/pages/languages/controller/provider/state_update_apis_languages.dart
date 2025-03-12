// import 'package:aswaq/pages/bar_categories/provider/api/api_get_category_data.dart';
// import 'package:aswaq/pages/bar_categories/provider/api/api_get_products.dart';
// import 'package:aswaq/pages/bar_categories/provider/api/api_get_sub_category.dart';
// import 'package:aswaq/pages/bar_categories/provider/helper/helper_bar_categories.dart';
// import 'package:aswaq/pages/bar_categories/view/bar_categories_screen.dart';
// import 'package:aswaq/pages/bar_home/provider/api/api_get_home_categories.dart';
// import 'package:aswaq/pages/bar_home/provider/api/api_get_home_dynamic_list_view.dart';
// import 'package:aswaq/pages/bar_more/provider/helper/helper_bar_more.dart';
// import 'package:aswaq/pages/languages/provider/api/api_get_app_languages.dart';
// import 'package:aswaq/pages/splash/provider/api/get_app_pagination.dart';
// import 'package:aswaq/provider/localization_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
//
// class StateUpdateApisLanguages{
//   HelperBarMore helperBarMore=HelperBarMore();
//   HelperBarCategories helperBarCategories=HelperBarCategories();
//   LocalizationProvider localizationProvider=LocalizationProvider();
//   ApiAppPaginationConfig apiAppPaginationConfig =ApiAppPaginationConfig();
//   ApiGetAppLanguages apiGetAppLanguages =ApiGetAppLanguages();
//   ApiGetHomeCategories apiGetHomeCategories =ApiGetHomeCategories();
//   ApiGetBarCategories apiGetBarCategories =ApiGetBarCategories();
//   ApiGeProducts apiGeProducts =ApiGeProducts();
//   ApiGetSubCategories apiGetSubCategories =ApiGetSubCategories();
//   ApiGetHomeDynamicListViews apiGetHomeDynamicListViews=ApiGetHomeDynamicListViews();
//
//   StateUpdateApisLanguages(BuildContext context){
//     helperBarMore=Provider.of<HelperBarMore>(context, listen: false);
//     localizationProvider=Provider.of<LocalizationProvider>(context, listen: false);
//     helperBarCategories=Provider.of<HelperBarCategories>(context, listen: false);
//   }
//
//   updateAPis({required BuildContext context })async{
//     apiGetHomeCategories.getHomeCategories(isHome: true,);
//     apiGetHomeDynamicListViews.getHomeDynamicListView(isHome: true);
//
//     await apiGetBarCategories.getCategoriesAndSubCategory(firstTime: true).then((value) {
//       // check if category not empty to select first index
//       apiGetSubCategories.getSubCategory(
//         context: context,
//         firstTime: true,
//         categoryId:apiGetBarCategories.barCategoriesModel.categoriesData.categories[helperBarCategories.selectedCategoryIndex].id,
//       );
//       apiGeProducts.getProducts(
//         context: context,
//         isFirstTime: true,
//         categoryId: SubCategoryScreen.categoryId,
//         brandId: SubCategoryScreen.brandId,
//         tagId: SubCategoryScreen.tagId,
//       );
//
//     });
//
//
//
//
//   }
// }