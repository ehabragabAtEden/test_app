import 'package:iem_app/service/api_handler/general_api_state.dart';

class ApiGetUnreadAppCount extends GeneralApiState {
  static final ApiGetUnreadAppCount controller =
      ApiGetUnreadAppCount._internal();
  factory ApiGetUnreadAppCount() {
    return controller;
  }
  ApiGetUnreadAppCount._internal();

  // UnreadCountModel unreadCountModel=UnreadCountModel.fromJson({});

  // Future getUnreadAppCountResponse({required BuildContext context,}) async {
  //   final notificationsCounterHelper=Provider.of<NotificationsCounterHelper>(RecruitmentApp.navigatorKey.currentState!.context,listen: false);
  //
  //   if(!UserDataFromStorage.userIsGuest){
  //     setWaiting();
  //
  //     await HttpHelper().callService(url:getUnreadBadgeCount, responseType:ResponseType.get,authorization:true).then((value) {
  //       unreadCountModel=UnreadCountModel.fromJson(value);
  //       setHasData();
  //       notificationsCounterHelper.setAppBadgeCount(count: unreadCountModel.data!);
  //       BadgeCountHandle.addBadgeCount(count: int.parse(unreadCountModel.data.toString()));
  //
  //       return unreadCountModel;
  //     }).catchError((error, stackTrace) {
  //       debugPrint("catchError --------------> $getUnreadBadgeCount\n error= $error");
  //       if(error.toString()=="internet"){
  //         setConnectionError();
  //       }
  //       else{
  //         setHasError();
  //         setError(error);
  //
  //       }
  //       return unreadCountModel;
  //
  //     });
  //
  //   }
  //
  // }
}
