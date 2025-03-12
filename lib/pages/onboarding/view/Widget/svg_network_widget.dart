import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgNetworkImageWidget extends StatelessWidget {

  final String image;
  final String errorImage;
  final BoxFit fit;
  final BoxFit errorFit;
  final Color errorBackground;
  final Color loadingColor;
  final double errorImageSize;
  final EdgeInsets errorPadding;
  final Alignment? errorAlignment;

  const SvgNetworkImageWidget({
    Key? key,
    required this.image,
    required this.errorImage,
    required this.fit,
    required this.errorFit,
    required this.errorBackground,
    required this.loadingColor,
    required this.errorImageSize,
    required this.errorPadding,
    required this.errorAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return Container(
        color: errorBackground,
        margin: errorPadding,
        child: Center(
          child: Image.asset(
            'assets/images/$errorImage',
            width: errorImageSize,
            height: errorImageSize,
            fit: errorFit,
            alignment:
                errorAlignment != null ? errorAlignment! : Alignment.center,
          ),
        ),
      );
    }
    return SvgPicture.network(
      image,
      fit: fit,
    );
  }
}
