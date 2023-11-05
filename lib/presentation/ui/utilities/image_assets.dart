import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageAssets {
  static const String craftyBayLogoSVG = 'assets/images/logo.svg';
  static const String craftyBayLogoNavSVG = 'assets/images/logo_nav.svg';
  static const String shoePng = 'assets/images/shoe.png';

  static final authLogo = SvgPicture.asset(
    ImageAssets.craftyBayLogoSVG,
    width: 100,
  );

  static final navLogo = SvgPicture.asset(
    ImageAssets.craftyBayLogoNavSVG,
  );

  static const shoeProductPng = AssetImage(
    ImageAssets.shoePng,
  );
}
