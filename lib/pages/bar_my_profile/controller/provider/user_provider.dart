import 'package:iem_app/pages/auth_log_in/model/auth_login_response_model.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  factory UserProvider() {
    _this ??= UserProvider._();
    return _this!;
  }
  static UserProvider? _this;
  UserProvider._();
  
  AuthLoginResponseModel? _authLoginResponseModel;
  AuthLoginResponseModel? get authLoginResponseModel => _authLoginResponseModel;
  setAuthResponse(AuthLoginResponseModel? authLoginResponseModel) {
    _authLoginResponseModel = authLoginResponseModel;
    notifyListeners();
  }

  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  setUser(UserModel? userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  TextEditingController firstNameController = TextEditingController(text: SharedPref.getUserObg()?.userData?.userModel?.name);
  TextEditingController lastNameController = TextEditingController(text: SharedPref.getUserObg()?.userData?.userModel?.code);
  TextEditingController emailController = TextEditingController(text: " Mohamed.a@gmail.com");
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();

  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isCurrentPasswordVisible = true;

  changePasswordIsVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  changeConfirmPasswordIsVisible() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  changeCurrentPasswordIsVisible() {
    isCurrentPasswordVisible = !isCurrentPasswordVisible;
    notifyListeners();
  }



  resetData() {
    notifyListeners();
  }

  listen() {
    notifyListeners();
  }
}
