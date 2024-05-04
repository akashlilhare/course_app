import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../enum/app_loading_staus.dart';
import '../model/course_model.dart';
import 'package:http/http.dart' as http;

class CourseProvider with ChangeNotifier {
  AppConnectionStatus connectionStatus = AppConnectionStatus.none;

  List<CourseModel> courseList = [];
  int currLimit = 10;

  loadCourse() async {
    try {
      connectionStatus = AppConnectionStatus.loading;
      notifyListeners();
      String url = "https://fakestoreapi.com/products?limit=$currLimit";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        courseList = List.from(json.decode(response.body))
            .map((e) => CourseModel.fromJson(e))
            .toList();

        connectionStatus = AppConnectionStatus.success;
        notifyListeners();
        print("success");
      }
    } catch (e) {
      print(e);
      connectionStatus = AppConnectionStatus.error;
      notifyListeners();
    }
  }

  onPageChange() async {
    currLimit = currLimit + 10;
    try {
      String url = "https://fakestoreapi.com/products?limit=$currLimit";

      print(url);

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var newCourseList = List.from(json.decode(response.body))
            .map((e) => CourseModel.fromJson(e))
            .toList();

        if (courseList.length != newCourseList.length) {
          courseList = newCourseList;
        }
      }
      print("object");
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
