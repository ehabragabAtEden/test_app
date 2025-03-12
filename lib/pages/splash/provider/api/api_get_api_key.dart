import 'package:iem_app/pages/splash/model/api_key_model.dart';
import 'package:iem_app/pages/splash/provider/helper/decode_api_key.dart';
import 'package:iem_app/service/api_handler/amnco_endpoints.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:iem_app/service/api_handler/http_request_handler.dart';
import 'package:flutter/foundation.dart';

class ApiGetApiKey extends GeneralApiState {

  static final ApiGetApiKey controller = ApiGetApiKey._internal();
  factory ApiGetApiKey() {
    return controller;
  }
  ApiGetApiKey._internal();
  ApiKeyModel apiKeyModel=ApiKeyModel.fromJson({});


  // Future getApiKey() async {
  //   setWaiting();
  //   await HttpHelper().callService(endPoint: AmncoEndPoints.getApiKey, requestType: RequestType.post,authorization:false).then((value) {
  //     if (value != null){
  //       apiKeyModel = ApiKeyModel.fromJson(value);
  //       apiKeyModel.decodedApiKey=DecodeApiKey().decodeApiKey(apiKey: apiKeyModel.token, key: apiKeyModel.key);
  //       if (kDebugMode) {
  //         print('apiKeyModel__________________________________________ =${apiKeyModel.decodedApiKey}');
  //       }
  //       setHasData();
  //     }
  //     else {
  //       setHasError();
  //       setError("Error: Response is null");
  //     }
  //     return apiKeyModel;
  //   }).catchError((error, stackTrace) {
  //     debugPrint("catchError --------------> ${AmncoEndPoints.getApiKey}    §   §\n error= $error");
  //     if(error.toString()=="internet"){
  //       setConnectionError();
  //     }
  //     else{
  //       setHasError();
  //       setError(error);
  //     }
  //
  //     return apiKeyModel;
  //   });
  // }
}
