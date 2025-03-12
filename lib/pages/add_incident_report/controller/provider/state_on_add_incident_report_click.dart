import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/add_incident_report/controller/api/api_add_incident_report.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:iem_app/pages/add_incident_report/model/people_involved_model.dart';
import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_toast/custom_toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatenOnAddIncidentReportClick {

  AddIncidentReportProvider addIncidentReportProvider = AddIncidentReportProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  HomeProvider homeProvider = HomeProvider();

  StatenOnAddIncidentReportClick(BuildContext context){
    addIncidentReportProvider = Provider.of<AddIncidentReportProvider>(context, listen: false);
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

  onAddIncidentReportClick(BuildContext context) async {
    FocusScope.of(context).unfocus();
    addIncidentReportProvider.setAutoValidate(true);
    if (addIncidentReportProvider.addVisitorKey.currentState!.validate()) {
      if(addIncidentReportProvider.pickedImages.length >=2){
        if(homeProvider.selectedBusinessActivity != null) {
          await ApiAddIncidentReport().apiAddIncidentReport(context: context, assignmentDetail: homeProvider.selectedBusinessActivity!);
          // if(addIncidentReportProvider.addIncidentReportResponseModel?.statusCode == 200 || addIncidentReportProvider.addIncidentReportResponseModel?.statusCode == 201) {
          //   print("addIncidentCarProvider.addVehicleResponseModel?.statusCode:: ${addIncidentReportProvider.addIncidentReportResponseModel?.statusCode}");
          //   addIncidentReportProvider.setAutoValidate(false);
          //   loadingProviderClass.setPageLoading(false);
          //   ShowToastFunctions.showToast(
          //     context: context,
          //     msg: "successfullyReportAdded".tr,
          //     toastType: ToastType.success,
          //   );
          //   Navigator.pop(context);
          //   addIncidentReportProvider.resetAddIncidentData();
          //
          // }

        }
          loadingProviderClass.setPageLoading(true);
        await Future.delayed(const Duration(seconds: 1));
        addIncidentReportProvider.setAutoValidate(false);
        loadingProviderClass.setPageLoading(false);

        // ShowToastFunctions.showToast(
        //   context: context,
        //   msg: "successfullyReportCar".tr,
        //   toastType: ToastType.success,
        // );
        // Navigator.pop(context);
        // addIncidentReportProvider.resetAddIncidentData();
      }else{
        ShowToastFunctions.showToast(
          context: context,
          msg: "mustSelectAtLeastImages".tr,
          toastType: ToastType.error,
        );
      }
    }else{
      addIncidentReportProvider.setAutoValidate(true);
      addIncidentReportProvider.listen();
    }
  }

}