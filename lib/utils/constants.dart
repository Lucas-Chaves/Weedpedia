import 'package:flutter/material.dart';
import 'package:maripedia/utils/utils.dart';

enum Race {
  Sativa,
  Indica,
  Hybrid,
}

const appBarColor = const Color(0xff5BD471);
final String baseUrl = 'http://strainapi.evanbusse.com/${Environment.apiKey}';
