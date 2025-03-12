import 'package:iem_app/pages/auth_log_in/model/auth_login_response_model.dart';
// import 'package:iem_app/pages/auth_sign_up/provider/helper/state_block_user.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  factory LoginProvider() {
    _this ??= LoginProvider._();
    return _this!;
  }
  static LoginProvider? _this;
  LoginProvider._();
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController identifierController = TextEditingController();
  GlobalKey<FormState> loginInKey = GlobalKey<FormState>();
  bool isVisible = false;
  bool isButtonEnable = false;
  AuthLoginResponseModel? _authLoginResponseModel;
  AuthLoginResponseModel? get authLoginResponseModel => _authLoginResponseModel;
  setAuthResponse(AuthLoginResponseModel? authLoginResponseModel) {
    _authLoginResponseModel = authLoginResponseModel;
    notifyListeners();
  }
  // to show validation on login
  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;
  setAutoValidate(bool autoValidate) {
    _autoValidate = autoValidate;
    notifyListeners();
  }
  bool _loading = false;
  bool get loading => _loading;
  setLoginLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
  // indicates login is successful or failed to navigate or show error
  bool _loginResult = false;
  bool get loginResult => _loginResult;
  setLoginResult(bool loginResult) {
    _loginResult = loginResult;
    notifyListeners();
  }

  changeIsVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  enableButton(){
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      isButtonEnable=true;
      notifyListeners();
    } else{
      isButtonEnable=false;
      notifyListeners();
    }
  }

  resetData() {
     emailController.clear();
     passwordController.clear();
     identifierController.clear();
     isVisible = false;
     isButtonEnable = false;
     // StateBlockUser().unBlockExpirationTime();
     notifyListeners();
  }

  listen() {
    notifyListeners();
  }
}
