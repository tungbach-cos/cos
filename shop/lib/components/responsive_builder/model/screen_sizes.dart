enum ScreenSizes {
  desktop(4),
  tablet(3),
  phone(2),
  mobile(1)
  ;

  const ScreenSizes(this.value);

  final int value;

  bool operator >(ScreenSizes other) => value > other.value;

  bool operator >=(ScreenSizes other) => value >= other.value;

  bool operator <(ScreenSizes other) => value < other.value;

  bool operator <=(ScreenSizes other) => value <= other.value;

  bool get isDesktop => this == .desktop;

  bool get isTablet => this == .tablet;

  bool get isPhone => this == .phone;

  bool get isMobile => this == .mobile;
}
