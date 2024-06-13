import 'package:ecoww/ui/educow/educow_detail_screen.dart';
import 'package:ecoww/ui/educow/educow_screen.dart';
import 'package:ecoww/ui/menu/profile.dart';
import 'package:ecoww/ui/navbar/navbar.dart';
import 'package:ecoww/ui/product/product_all.dart';
import 'package:ecoww/ui/product/rekomendasi.dart';
import 'package:flutter/material.dart';
import 'package:ecoww/ui/login.dart';
import 'package:ecoww/ui/menu/home_screen.dart';
import 'package:ecoww/ui/register.dart';

MaterialPageRoute _pageRoute(
        {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);
Route? generateRoute(RouteSettings settings) {
  Route? _route;
  final _args = settings.arguments;
  switch (settings.name) {
    case rLogin:
      _route = _pageRoute(body: LoginScreen(), settings: settings);
      break;
    case rRegister:
      _route = _pageRoute(body: RegisterScreen(), settings: settings);
      break;
    case rHome:
      _route = _pageRoute(body: HomeScreen(), settings: settings);
    case rProductAllScreen:
      _route = _pageRoute(body: ProductAllScreen(), settings: settings);
    case rRekomendasiScreen:
      _route = _pageRoute(body: RekomendasiScreen(), settings: settings);
    case rEducowScreen:
      _route = _pageRoute(body: EducowScreen(), settings: settings);
    case rEducowDetailScreen:
      _route = _pageRoute(body: EducowDetailScreen(), settings: settings);
    case rProfileScreen:
      _route = _pageRoute(body: ProfileScreen(), settings: settings);
    case rBar:
      _route = _pageRoute(body: BottomNavigationBarExample(), settings: settings);
      break;
  }
  return _route;
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rLogin = '/login';
const String rRegister = '/register';
const String rHome = '/home';
const String rProductAllScreen = '/ProductAllScreen';
const String rRekomendasiScreen = '/RekomendasiScreen';
const String rEducowScreen = '/EducowScreen';
const String rEducowDetailScreen = '/EducowDetailScreen';
const String rProfileScreen = '/ProfileScreen';
const String rBar = '/Bar';
