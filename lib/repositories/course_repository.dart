import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/app_data.dart';

class CourseRepository {
  final String assetPath;

  CourseRepository({this.assetPath = 'assets/data.json'});

  /// Loads application data asynchronously from the asset JSON file
  Future<AppData> loadAppData({Duration delay = const Duration(milliseconds: 1500)}) async {
    // Simulate real network/async loading latency to demonstrate Loading state
    if (delay > Duration.zero) {
      await Future.delayed(delay);
    }

    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final dynamic map = json.decode(jsonString);
      return AppData.fromJson(map as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to load JSON data from asset assetPath: $e');
    }
  }
}
