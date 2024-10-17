// ignore_for_file: camel_case_types

enum kPlatformTypes { mobile, tablet, desktop }

class kScreenSizes {
  static const _mobileMax = 480;
  static const _tabletMax = 1024;

  static kPlatformTypes getPlatform(double width) {
    if (width <= _mobileMax) {
      return kPlatformTypes.mobile;
    } else if (width >= _mobileMax && width <= _tabletMax) {
      return kPlatformTypes.tablet;
    }
    return kPlatformTypes.desktop;
  }
}
