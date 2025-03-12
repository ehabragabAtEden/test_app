import 'package:iem_app/pages/onboarding/model/onboarding_model.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';

class ApiGetOnBoarding extends GeneralApiState {
  static final ApiGetOnBoarding controller = ApiGetOnBoarding._internal();
  factory ApiGetOnBoarding() {
    return controller;
  }
  ApiGetOnBoarding._internal();
  OnBoardingModel onBoardingModel = OnBoardingModel.fromJson({});

  //  Future getOnBoardingResponse({required BuildContext context}) async{
  //    setWaiting();
  //    await HttpHelper().callService(url:getOnBoarding, responseType:ResponseType.get,authorization:!UserDataFromStorage.userIsGuest).then((value) {
  //      onBoardingModel=OnBoardingModel.fromJson(value);
  //      setHasData();
  //      return onBoardingModel;
  //    }).catchError((error, stackTrace) {
  //      debugPrint("catchError --------------> $getAreaOfExpertiseURL\n error= $error");
  //      if(error.toString()=="internet"){
  //        setConnectionError();
  //      }
  //      else{
  //        setHasError();
  //        setError(error);
  //
  //      }
  // return onBoardingModel;
  //    });
  //  }
}
