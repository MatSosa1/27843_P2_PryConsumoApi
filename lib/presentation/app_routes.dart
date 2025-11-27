import 'package:flutter/material.dart';
import 'package:pry_api_rest/presentation/views/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (_) => const HomePage(),
  };
}
