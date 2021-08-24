part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const OTHER = _Paths.OTHER;
}

abstract class _Paths {
  static const HOME = '/';
  static const OTHER = '/other';
}
