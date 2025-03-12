import 'package:iem_app/helpers/connectivity_helpers/connectivity_init_provider.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_theme_provider.dart';
import 'package:iem_app/pages/add_incident_car/controller/provider/add_incident_car_provider.dart';
import 'package:iem_app/pages/add_incident_report/controller/provider/add_incident_report_provider.dart';
import 'package:iem_app/pages/add_visitor/controller/provider/add_visitor_provider.dart';
import 'package:iem_app/pages/auth_log_in/controller/provider/login_provider.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_my_performance/controller/provider/my_performance_provider.dart';
import 'package:iem_app/pages/bar_settings/controller/provider/settings_provider.dart';
import 'package:iem_app/pages/bottom_bar/controller/provider/bottom_bar_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/pages/splash/provider/helper/splash_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/provider/localization_provider.dart';
import 'package:iem_app/service/api_handler/general_api_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(value: LoadingProviderClass()),
  ChangeNotifierProvider.value(value: LocalizationProvider()),
  ChangeNotifierProvider.value(value: AppThemeProvider()),
  ChangeNotifierProvider.value(value: ConnectivityInitProvider()),
  ChangeNotifierProvider.value(value: GeneralApiState()),
  ChangeNotifierProvider.value(value: SplashProvider()),
  ChangeNotifierProvider.value(value: BottomBarProvider()),
  // ChangeNotifierProvider.value(value: ForgetPasswordHelper()),
  // ChangeNotifierProvider.value(value: ForgetPasswordHelper()),
  // ChangeNotifierProvider.value(value: HelperSuccessfullyWithdraw()),
  // ChangeNotifierProvider.value(value: HelperMap()),
  // ChangeNotifierProvider.value(value: HelperMyProfile()),
  ChangeNotifierProvider.value(value: LoginProvider()),
  // ChangeNotifierProvider.value(value: HelperNotification()),
  // ChangeNotifierProvider.value(value: HelperFilter()),
  // ChangeNotifierProvider.value(value: SignUpHelper()),
  // ChangeNotifierProvider.value(value: OtpHelper()),
  ChangeNotifierProvider.value(value: HomeProvider()),
  ChangeNotifierProvider.value(value: UserProvider()),
  ChangeNotifierProvider.value(value: AddVisitorProvider()),
  ChangeNotifierProvider.value(value: MyPerformanceProvider()),
  ChangeNotifierProvider.value(value: SettingsProvider()),
  ChangeNotifierProvider.value(value: AddIncidentReportProvider()),
  ChangeNotifierProvider.value(value: AddIncidentCarProvider()),



];
