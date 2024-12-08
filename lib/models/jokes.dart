// To parse this JSON data, do
//
//     final jokes = jokesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<String> jokesFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String jokesToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
