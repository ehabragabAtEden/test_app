
import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
import 'package:iem_app/pages/bar_home/model/fulfill_post_response_model.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ApiPostFulFilled extends GeneralApiState {
  static final ApiPostFulFilled apiCheckInOut = ApiPostFulFilled._internal();
  factory ApiPostFulFilled() {
    return apiCheckInOut;
  }
  ApiPostFulFilled._internal();

  HomeProvider homeProvider = HomeProvider();
  LoadingProviderClass loadingProviderClass = LoadingProviderClass();
  UserProvider userProfileProvider =  UserProvider();


  Future apiPostFulFilled({required BuildContext context, required AssignmentDetail assignmentDetail}) async{
    loadingProviderClass = Provider.of<LoadingProviderClass>(context, listen: false);
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    loadingProviderClass.setCheckInOutLoading(true);
    loadingProviderClass.listen();
    // var body = ;
    setWaiting();
    await ApiHelper.apiCalling(
        endPoint: AmncoEndPoints.postAssignmentFulfillment,
        requestType: RequestType.post,
        authorization: true,
        body: {
          "assignmentDetailId": assignmentDetail.id ?? -1,
        },
    ).then((value) async {
      print("rspons${value?.body}");
      loadingProviderClass.setCheckInOutLoading(false);
      homeProvider.setFulfillmentPostResponse(FulfillmentPostResponseModel.fromJson(value));
      if (kDebugMode) {
        print("hisham ${homeProvider.fulfillmentPostResponseModel?.statusCode}");
      }
    }).catchError((error) {
    });
    loadingProviderClass.setCheckInOutLoading(false);

  }


void showDialoog(BuildContext context) {
  homeProvider = Provider.of<HomeProvider>(context, listen: false);

  homeProvider.showAnimation = true;
  setWaiting();
  Future.delayed(Duration(seconds: 2), () {
    homeProvider.showAnimation = false;
    if(context.mounted && homeProvider.showAnimation == false) {
      Navigator.pop(context);
    }
    // emit(ShowLottileSucsessState()); // إغلاق الـ Dialog بعد انقضاء المدة الزمنية
  });
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/images/ddone.json',
                repeat: false,
                height: 100,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animate: homeProvider.showAnimation),
          ],
        ),
      )).then((value) =>Navigator.pop(context));
}

}
