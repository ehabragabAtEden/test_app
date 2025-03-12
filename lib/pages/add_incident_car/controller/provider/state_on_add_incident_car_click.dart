import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/add_incident_car/controller/api/api_add_incident_car.dart';
import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_toast/custom_toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// class StatenOnAddVisitorClick {
//
//   AddVisitorProvider addVisitorProvider = AddVisitorProvider();
//   LoadingProviderClass loadingProviderClass = LoadingProviderClass();
//   StatenOnAddVisitorClick(BuildContext context){
//     addVisitorProvider = Provider.of<AddVisitorProvider>(context, listen: false);
//     loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
//   }
//
//   addVisitor({required BuildContext context}) async {
//     FocusScope.of(context).unfocus();
//     addVisitorProvider.setAutoValidate(true);
//     if (addVisitorProvider.addVisitorKey.currentState!.validate()) {
//       loadingProviderClass.setPageLoading(true);
//      await Future.delayed(const Duration(seconds: 1));
//       addVisitorProvider.setAutoValidate(false);
//       loadingProviderClass.setPageLoading(false);
//
//       ShowToastFunctions.showToast(
//         context: context,
//         msg: "successfullyAddedVisitor".tr,
//         toastType: ToastType.success,
//       );
//       Navigator.pop(context);
//       addVisitorProvider.resetAddVisitorData();
//     }else{
//       addVisitorProvider.setAutoValidate(true);
//       addVisitorProvider.listen();
//     }
//   }
//
// }
/// todo: the following is integrated
// /*
import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/add_visitor/controller/api/api_add_visitor.dart';
import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_toast/custom_toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatenOnAddIncidentCarClick {

  AddIncidentCarProvider addIncidentCarProvider = AddIncidentCarProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  HomeProvider homeProvider = HomeProvider();

  StatenOnAddIncidentCarClick(BuildContext context){
    addIncidentCarProvider = Provider.of<AddIncidentCarProvider>(context, listen: false);
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
    homeProvider = Provider.of<HomeProvider>(context, listen: false);

  }

  onAddIncidentCarClick({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    addIncidentCarProvider.setAutoValidate(true);

    if (addIncidentCarProvider.addIncidentCarKey.currentState!.validate()) {
      if(addIncidentCarProvider.pickedImages.length >=2){
        loadingProviderClass.setPageLoading(true);
        if(homeProvider.selectedBusinessActivity != null) {
           await ApiAddIncidentCar().apiAddIncidentCar(context: context, assignmentDetail: homeProvider.selectedBusinessActivity!);
           print("addIncidentCarProvider.addVehicleResponseModel?.statusCode:: ${addIncidentCarProvider.addVehicleResponseModel?.statusCode}");

           if(addIncidentCarProvider.addVehicleResponseModel?.statusCode == 200 || addIncidentCarProvider.addVehicleResponseModel?.statusCode == 201) {
            print("addIncidentCarProvider.addVehicleResponseModel?.statusCode:: ${addIncidentCarProvider.addVehicleResponseModel?.statusCode}");
            addIncidentCarProvider.setAutoValidate(false);
            loadingProviderClass.setPageLoading(false);
            ShowToastFunctions.showToast(
              context: context,
              msg: "successfullyAddedCar".tr,
              toastType: ToastType.success,
            );
            Navigator.pop(context);
            addIncidentCarProvider.resetIncidentCarData();

          }

        }
      }else{
        ShowToastFunctions.showToast(
          context: context,
          msg: "mustSelectAtLeastImages".tr,
          toastType: ToastType.error,
        );
      }
    }else{
      ShowToastFunctions.showToast(
        context: context,
        msg: addIncidentCarProvider.addVehicleResponseModel?.message ?? '',
        toastType: ToastType.error,
      );
      addIncidentCarProvider.setAutoValidate(true);
      addIncidentCarProvider.listen();
    }
  }

}
