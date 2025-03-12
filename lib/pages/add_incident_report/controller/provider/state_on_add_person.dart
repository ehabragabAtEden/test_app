import 'package:iem_app/helpers/popup_helpers/toast_helpers.dart';
import 'package:iem_app/main.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:iem_app/pages/add_incident_report/model/people_involved_model.dart';
import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_toast/custom_toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatenOnAddPerson{

  AddIncidentReportProvider addIncidentReportProvider = AddIncidentReportProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  StatenOnAddPerson(BuildContext context){
    addIncidentReportProvider = Provider.of<AddIncidentReportProvider>(context, listen: false);
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
  }

  onAddPerson(BuildContext context) async {
    FocusScope.of(context).unfocus();
    addIncidentReportProvider.setAutoValidate(true);
    if (addIncidentReportProvider.enableInsertPersonButton) {
      loadingProviderClass.setPageLoading(true);
      addIncidentReportProvider.peopleInvolvedList.add(
        PeopleInvolved(
          nationalId: addIncidentReportProvider.nationalIdController.text,
          name: addIncidentReportProvider.incidentNameController.text,
          phone: addIncidentReportProvider.incidentPhoneController.text,
        ),
      );
      addIncidentReportProvider.resetPeopleInvolvedData();
     // await Future.delayed(const Duration(seconds: 1));
      addIncidentReportProvider.setAutoValidate(false);
      loadingProviderClass.setPageLoading(false);

      // ShowToastFunctions.showToast(
      //   context: context,
      //   msg: "successfullyAddedVisitor".tr,
      //   toastType: ToastType.success,
      // );
      // Navigator.pop(context);
      // addIncidentReportProvider.resetAddVisitorData();
    }else{
      addIncidentReportProvider.setAutoValidate(true);
      addIncidentReportProvider.listen();
    }
  }

}