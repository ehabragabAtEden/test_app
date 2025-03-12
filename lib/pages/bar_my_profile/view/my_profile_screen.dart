
import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/pages/bar_home/controller/provider/home_provider.dart';
import 'package:iem_app/pages/bar_my_profile/controller/provider/user_provider.dart';
import 'package:iem_app/provider/loading_provider.dart';
import 'package:iem_app/utilites/shared_preferences/shared_preferances.dart';
import 'package:iem_app/utils/extensions/app_size_boxes.dart';
import 'package:iem_app/utils/extensions/string_extension.dart';
import 'package:iem_app/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Consumer3<UserProvider, LoadingProviderClass, HomeProvider>(
        builder: (context, userProvider, loadingProviderClass, homeProvider, child) {
          return  Padding(
            // padding: EdgeInsets.symmetric(horizontal: SizeConfig.height * 0.017),
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: CustomScrollView(
              slivers: [
                const SliverPersistentHeader(
                  pinned: true,
                  delegate: MyHeaderDelegate(),
                ),
                const _SliverList(),

                SliverToBoxAdapter(
                  child: 0.15.heightBox,
                ),

              ]
            ),
          );
        },
      ),
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const MyHeaderDelegate();

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,) {
    final progress = shrinkOffset / maxExtent;

    return Material(
      child: Consumer<HomeProvider>(
        builder: (context, homeProviderr, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: progress,
                child: const ColoredBox(
                  color: Color(0xBE7A81FF),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: 1 - progress,
                child:
                // Container(
                //   color: ColorConfig().primaryColor(1),
                // ),

                const CustomImageNetwork(image: 'https://cdn.mos.cms.futurecdn.net/xaycNDmeyxpHDrPqU6LmaD-1200-80.jpg', fit: BoxFit.cover, errorImageSize: double.infinity,),

              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                padding: EdgeInsets.lerp(
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  const EdgeInsets.only(bottom: 16),
                  progress,
                ),
                alignment: AlignmentDirectional.lerp(
                  AlignmentDirectional.bottomStart,
                  AlignmentDirectional.bottomCenter,
                  progress,
                ),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: maxExtent != minExtent ? ColorConfig().primaryColor(0.4) : Colors.transparent,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Text(
                    "${SharedPref.getUserObg()?.userData?.userModel?.name}",
                    style: TextStyle.lerp(
                      Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: maxExtent != minExtent ? Colors.white : Colors.black),
                      Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                      progress,
                    ),
                  ),
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                // leading: BackButton(),
                // actions: [
                //   IconButton(
                //     icon: const Icon(Icons.search),
                //     onPressed: () {},
                //   ),
                //   IconButton(
                //     icon: const Icon(Icons.more_vert),
                //     onPressed: () {},
                //   ),
                // ],
                elevation: 0,
              ),
            ],
          );
        }
      ),
    );
  }

  @override
  double get maxExtent => 264;

  @override
  double get minExtent => SizeConfig.height * .12;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

class _SliverList extends StatelessWidget {
  const _SliverList();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProviderr, _) {
        return SliverList(
          delegate: SliverChildListDelegate(
            [
              ListTile(
                title: Text("${SharedPref.getUserObg()?.userData?.userModel?.code}",),
                // subtitle: Text('code'.tr),
                leading: Icon(Icons.contact_mail, color: ColorConfig().primaryColor(1),),
                // trailing: IconButton(
                //   icon: const Icon(Icons.mail),
                //   onPressed: () {},
                // ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.width *0.3),
                child: Divider(color: ColorConfig().primaryColor(1)),
              ),

              ListTile(
                title: Text("${SharedPref.getUserObg()?.userData?.userModel?.phone}",),
                // subtitle: Text('mobile'.tr),
                leading: Icon(Icons.phone, color: ColorConfig().primaryColor(1),),
                // trailing: IconButton(
                //   icon: const Icon(Icons.message),
                //   onPressed: () {},
                // ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.width *0.3),
                child: Divider(color: ColorConfig().primaryColor(1)),
              ),

              ListTile(
                title: Text("${SharedPref.getUserObg()?.userData?.userModel?.email}",),
                 // subtitle: Text('email'.tr),
                leading: Icon(Icons.mail, color: ColorConfig().primaryColor(1),),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.width *0.3),
                child: Divider(color: ColorConfig().primaryColor(1)),
              ),

               ListTile(
                 title: Text("${SharedPref.getUserObg()?.userData?.userModel?.businessRole?.name}",),
                 // subtitle: Text('role'.tr),
                leading: Icon(Icons.work, color: ColorConfig().primaryColor(1),),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.width *0.3),
                child: Divider(color: ColorConfig().primaryColor(1)),
              ),

               ListTile(
                 title: Text("${SharedPref.getUserObg()?.userData?.userModel?.organizationUnit?.name ?? 'amnco'.tr}",),
                 // subtitle: Text('organization'.tr),
                leading: Icon(Icons.account_balance, color: ColorConfig().primaryColor(1),),
              ),

            ],
          ),
        );
      }
    );
  }
}