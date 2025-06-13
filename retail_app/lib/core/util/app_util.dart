import 'package:retail_app/core/enums/app_enum.dart';

class AppUtil {
  AppUtil._privateConstructor();

  static final AppUtil _instance = AppUtil._privateConstructor();

  factory AppUtil() {
    return _instance;
  }

  AppType? _appType;

  AppType get appType => _appType ?? AppType.food;

  set appType(AppType? value) {
    _appType = value;
  }
}
