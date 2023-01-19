extension ColorStringExtension on String? {
  int get colorValue {
    var newColor = this?.replaceFirst('#', '0xff') ?? '';
    // print(newColor);
    return int.parse(newColor);
  }
}
