import 'package:iem_app/pages/bar_home/model/assignment_model.dart';
// import 'package:iem_app/pages/bar_home/controller/api/api_check_in_out.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateOnCheckInOut {
  HomeProvider homeProvider = HomeProvider();
  StateOnCheckInOut(BuildContext context){
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

  onCheckInOut({required BuildContext context, required AssignmentDetail assignmentDetail}) async {
    // await ApiCheckInOut().apiCheckInOutDetails(context: context, assignmentDetail: assignmentDetail);
    // ApiCheckInOut().setHasData();
    // var cubit = HomeShiftCubit.get(context);
    // HomeShiftCubit.get(context).getCurrentLocation();
    // print("cubit.getchckedstatus(shiftModel: shiftModel) ${homeProvider.checkEmployeeStatus(shiftModel: shiftModel) }");
    if (homeProvider.selectedBusinessActivity?.isFulfilled == true) {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
        content: Text(
          'This Period is Done Already',
          style: TextStyle(
              color: Color.fromARGB(255, 152, 12, 2),
          ),
        ),
        backgroundColor: Colors.white,
      ));
      return;
    }
    // isLoading = true;
    // setState(() {

    // });
    // await  cubit.checkedinout(context: context, shiftDetails: shiftModel);
    // isLoading = false;
    // setState(() {

    // });
  }
}