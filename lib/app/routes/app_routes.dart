part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const FIRST = _Paths.FIRST;
}

abstract class _Paths {
  static const HOME = '/';
  static const FIRST = '/first';
}
