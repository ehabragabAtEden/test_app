import 'package:iem_app/pages/splash/model/os_version_model.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';

class ApiOsVersionProvider extends GeneralApiState {
  OsVersionModel osVersionModel = OsVersionModel.fromJson({});

  Future getVersion() async {
    setWaiting();
    setConnectionError();
    //    await HttpHelper().callService(url: oSVersionApi, responseType:ResponseType.get, authorization:!UserDataFromStorage.userIsGuest,).then((value)
    //    {
    //      osVersionModel=OsVersionModel.fromJson(value);
    //      if (kDebugMode) {
    //        print(value);
    //      }
    //      setConnectionError();
    //      setHasData();
    //      return osVersionModel;
    //
    //    }).catchError((error, stackTrace)
    //    {
    //      // debugPrint("catchError --------------> $updateUserCertificationURL\n error= $error");
    //      if(error.toString()=="internet"){
    //        setConnectionError();
    //      }
    //      else{
    //        setHasError();
    //        setError(error);
    //
    //      }
    // return osVersionModel;
    //    });
  }
}
