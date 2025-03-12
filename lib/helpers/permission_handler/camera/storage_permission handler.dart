// // ignore_for_file: file_names
//
// import 'package:app_settings/app_settings.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class StoragePermissionHandel {
//   static Future<bool> askLocationPermission() async {
//     var status = await Permission.storage.status;
//     if (status.isGranted) {
//       debugPrint(status.name);
//       return true;
//     }
//
//     if (status.isPermanentlyDenied) {
//       debugPrint(status.name);
//       await AppSettings.openAppSettings();
//       return false;
//     } else {
//       debugPrint(status.name);
//       await Permission.storage.request().then((value) {
//         if (!status.isPermanentlyDenied) {
//           return true;
//         } else {
//           return false;
//         }
//       });
//     }
//     return false;
//   }
// }
