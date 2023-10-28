import 'package:flutter/material.dart';

class CourseEnrollmentProvider extends ChangeNotifier {
  final Map<int, bool> _enrolledCourses = {};

  Map<int, bool> get enrolledCourses => _enrolledCourses;

  bool isCourseEnrolled(int courseId) {
    return _enrolledCourses.containsKey(courseId) &&
        _enrolledCourses[courseId] == true;
  }

  void enrollCourse(int courseId) {
    _enrolledCourses[courseId] = true;
    notifyListeners();
  }
}
