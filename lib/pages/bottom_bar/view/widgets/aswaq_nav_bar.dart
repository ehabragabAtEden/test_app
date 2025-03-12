// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:iem_app/helpers/app_size_config.dart';
import 'package:iem_app/helpers/thems_and_decorations/app_color_config.dart';
import 'package:iem_app/widgets/custom_stack_widget.dart';
import 'package:iem_app/widgets/visible_widget.dart';
import 'package:flutter/material.dart';

class AmncoNavBar extends StatefulWidget {

  /// List of [MoltenTab], each wil have an icon as the main widget, selcted color and unselected color
  final List<MoltenTab> tabs;

  /// The currently selected tab
  final int selectedIndex;

  final Function(int index) onTabChange;

  final Curve curve;

  /// How long the animation should last, Default is Duration(milliseconds: 150)
  final Duration? duration;


  /// Applied to all border sides
  final Color? borderColor;

  /// Note that high radius values may decrease the dome width.
  final BorderRadius? borderRadius;

  const AmncoNavBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChange,
    this.duration,
    this.curve = Curves.linear,
    this.borderColor,
    this.borderRadius,
  });

  @override
  State<AmncoNavBar> createState() => _AmncoNavBarState();
}

class _AmncoNavBarState extends State<AmncoNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.bottomPadding>0?(SizeConfig.height * 0.065+SizeConfig.bottomPadding):(SizeConfig.height * 0.09),
      child: LayoutBuilder(builder: (context, constraints) {
        final selectedBorderRadius = widget.borderRadius ?? BorderRadius.only(topLeft: Radius.circular(SizeConfig.height * 0.0107), topRight: Radius.circular(SizeConfig.height * 0.017));

        final Color selectedBarColor = Theme.of(context).colorScheme.surface;

        final double selectedTabWidth = (constraints.biggest.width ) / widget.tabs.length;

        final double selectedDomeWidth = min(100, selectedTabWidth);

        return CustomStackWidget(
          alignment: Alignment.bottomCenter,
          children: [
            _animatedPositionedDome(
              top: -(SizeConfig.height * 0.01),
              tabWidth: selectedTabWidth,
              domeWidth: selectedDomeWidth - selectedBorderRadius.topRight.x,
              domeHeight: SizeConfig.height*0.02680,
              domeColor: (widget.borderColor ?? selectedBarColor),
            ),

            // border for the dome
            Container(
              height: SizeConfig.bottomPadding>0?(SizeConfig.height * 0.05+SizeConfig.bottomPadding):(SizeConfig.height * 0.07),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorConfig().greyBlackColor(0.4),
                    blurRadius: SizeConfig.height * 0.017,
                    spreadRadius: SizeConfig.height * 0.01,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
            ),

            // Actual dome
            _animatedPositionedDome(
              top: -(SizeConfig.height * 0.0214),
              tabWidth: selectedTabWidth,
              domeWidth: selectedDomeWidth - selectedBorderRadius.topRight.x,
              domeHeight: SizeConfig.height*0.0268,
              domeColor: Colors.transparent,
            ),

            ...widget.tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final isSelected = index == widget.selectedIndex;
              // final title = entry.value.title;
              return AnimatedPositionedDirectional(
                curve: widget.curve,
                duration: widget.duration ?? const Duration(milliseconds: 150),
                top: isSelected ? -(SizeConfig.height * 0.01)  : (SizeConfig.height * 0.02),
                bottom: (SizeConfig.height * 0.0),
                start: selectedTabWidth * index,
                width: _normalizeDomeOnEdge(selectedTabWidth, index),
                child: _MoltenTabWrapper(
                  tab: entry.value,
                  onTab: () => widget.onTabChange(index),
                  isSelected: isSelected,
                  circleSize: SizeConfig.height * 0.0128,
                ),
              );
            }),
          ],
        );
      }),
    );
  }

  Widget _animatedPositionedDome({
    required double top,
    required double domeWidth,
    required double domeHeight,
    required Color domeColor,
    required double tabWidth,
  }) {
    return AnimatedPositioned(
      curve: widget.curve,
      duration: widget.duration ?? const Duration(milliseconds: 150),
      top: top,
      left: tabWidth * widget.selectedIndex,
      child: AnimatedContainer(
        duration: widget.duration ?? const Duration(milliseconds: 150),
        width: _normalizeDomeOnEdge(tabWidth, widget.selectedIndex),
        child: Center(
          child: _MoltenDome(
            color: domeColor,
            height: domeHeight,
            width: domeWidth,
          ),
        ),
      ),
    );
  }

  double _normalizeDomeOnEdge(double x, int index) {
    double newPos;
    if (index == 0) {
      newPos = x ;
    } else if (index == widget.tabs.length - 1) {
      newPos = x ;
    } else {
      newPos = x;
    }

    return newPos;
  }
}

/// Wraps the [MoltenTab] with extra attributes.
class _MoltenTabWrapper extends StatelessWidget {
  final MoltenTab tab;
  final bool isSelected;
  final VoidCallback onTab;
  final double circleSize;
  const _MoltenTabWrapper({
    required this.tab,
    required this.isSelected,
    required this.onTab,
    required this.circleSize,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.height*0.07,
      child: InkWell(
        onTap: onTab,
        child: Column(
          children: [
            Material(
              shape: CircleBorder(
                side: BorderSide(width: isSelected ? 5 : 0, color: ColorConfig().scaffoldBackgroundColor(1),),
              ),
              clipBehavior: Clip.none,
              color: Colors.transparent,
              child: tab.icon,
            ),

            VisibleWidget(
              visible: isSelected,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: SizeConfig.height * 0.008,),
                  height: SizeConfig.height * 0.006,
                  decoration: BoxDecoration(
                    color:  ColorConfig().primaryColor(isSelected?1:0),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoltenTab {
  /// Can be any [Widget].
  final Widget icon;

  /// title when tab is selected
  final Widget? title;

  /// The [icon] color when the tab is selected
  /// White if not set
  final Color? selectedColor;

  /// The [icon] color when the tab is unselected
  /// Grey if not set
  final Color? unselectedColor;

  /// This represents each tab in the navigation bar.
  /// [icon] must not be null
  MoltenTab({
    required this.icon,
    this.selectedColor,
    this.title,
    this.unselectedColor,
  });
}

class _MoltenDome extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  const _MoltenDome({
    required this.color,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          painter: _DomePainter(color: Colors.transparent),
          size: Size(width, height),
        );
      },
    );
  }
}

class _DomePainter extends CustomPainter {
  final Color color;
  _DomePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    Path path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(0, size.height, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width * 0.94, size.height, size.width * 0.83, size.height * 0.65, size.width * 0.72, size.height * 0.31);
    path.cubicTo(size.width * 0.67, size.height * 0.12, size.width * 0.59, size.height * 0.01, size.width * 0.51, 0);
    path.cubicTo(size.width * 0.51, 0, size.width * 0.51, 0, size.width * 0.51, 0);
    path.cubicTo(size.width * 0.42, -0.01, size.width * 0.34, size.height * 0.11, size.width * 0.27, size.height * 0.31);
    path.cubicTo(size.width * 0.17, size.height * 0.65, size.width * 0.06, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height, 0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}