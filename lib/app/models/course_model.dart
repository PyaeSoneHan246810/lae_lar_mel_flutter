import 'package:lae_lar_mel_app/app/enums/enums.dart';
import 'package:lae_lar_mel_app/app/models/course_material_model.dart';

import 'course_section_model.dart';

class Course {
  int courseId;
  CourseType courseType;
  String courseImage;
  String courseName;
  String coursePrice;
  int courseTotalDurationInHours;
  String courseInstructorImage;
  String courseInstructorName;
  String courseInstructorMajor;
  String courseInstructorDescription;
  String courseLanguageCategory;
  String courseLevel;
  String courseSkill;
  Uri coursePreviewVideo;
  List<CourseSection> courseSections;
  Course({
    required this.courseId,
    required this.courseType,
    required this.courseImage,
    required this.courseName,
    required this.coursePrice,
    required this.courseTotalDurationInHours,
    required this.courseInstructorImage,
    required this.courseInstructorName,
    required this.courseInstructorMajor,
    required this.courseInstructorDescription,
    required this.courseLanguageCategory,
    required this.courseLevel,
    required this.courseSkill,
    required this.coursePreviewVideo,
    required this.courseSections,
  });
  static List<Course> getCourses() {
    List<Course> courses = [];
    courses.add(
      Course(
        courseId: 1,
        courseType: CourseType.free,
        courseImage:
            'https://m.economictimes.com/thumb/msid-77058712,width-1200,height-900,resizemode-4,imgsize-172210/english_istock.jpg',
        courseName: 'Basic English Grammar Course',
        coursePrice: 'Free',
        courseTotalDurationInHours: 2,
        courseInstructorImage:
            'https://www.studykyoto.jp/wp/wp-content/uploads/2020/10/student_zhang04.jpg',
        courseInstructorName: 'Tr. Hsu',
        courseInstructorMajor: 'YUFL English',
        courseInstructorDescription:
            'Tr. Hsu is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        courseLanguageCategory: 'English',
        courseLevel: 'Beginner',
        courseSkill: 'Grammar',
        coursePreviewVideo: Uri(
          scheme: 'https',
          host: 'assets.mixkit.co',
          path:
              '/videos/preview/mixkit-young-boy-learning-english-in-classroom-9089-large.mp4',
        ),
        courseSections: [
          CourseSection(
            courseSectionId: 1,
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Introduction to the course',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lessons Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Goals & Grammar List',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Classroom Vocabulary',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.document,
                courseMaterialTitle: 'Download the textbook',
              ),
            ],
          ),
          CourseSection(
            courseSectionId: 2,
            courseSectionTitle: 'Lesson 1',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lesson 1 Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.quiz,
                courseMaterialTitle: 'Lesson 1 Quizzes',
                duration: '03.00 mins',
              ),
            ],
          ),
          CourseSection(
            courseSectionId: 3,
            courseSectionTitle: 'Lesson 2',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lesson 2 Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.document,
                courseMaterialTitle: 'Download the notes',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.quiz,
                courseMaterialTitle: 'Lesson 2 Quizzes',
                duration: '03.00 mins',
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 2,
        courseType: CourseType.free,
        courseImage:
            'https://teaching.weblogs.anu.edu.au/files/2023/05/Speaking-English862x485.jpg',
        courseName: 'Daily English Conversations',
        coursePrice: 'Free',
        courseTotalDurationInHours: 2,
        courseInstructorImage:
            'https://motto-jp.com/media/wp-content/uploads/2021/04/AdobeStock_74877484.jpeg',
        courseInstructorName: 'Tr. May',
        courseInstructorMajor: 'YUFL English',
        courseInstructorDescription:
            'Tr. May is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        courseLanguageCategory: 'English',
        courseLevel: 'Beginner',
        courseSkill: 'Speaking',
        coursePreviewVideo: Uri(
          scheme: 'https',
          host: 'assets.mixkit.co',
          path:
              '/videos/preview/mixkit-date-between-two-girl-friends-in-a-coffee-shop-41813-large.mp4',
        ),
        courseSections: [
          CourseSection(
            courseSectionId: 1,
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Introduction to the course',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lessons Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Goals & Grammar List',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Classroom Vocabulary',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.document,
                courseMaterialTitle: 'Download the textbook',
              ),
            ],
          ),
          CourseSection(
            courseSectionId: 2,
            courseSectionTitle: 'Lesson 1',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lesson 1 Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.quiz,
                courseMaterialTitle: 'Lesson 1 Quizzes',
                duration: '03.00 mins',
              ),
            ],
          ),
          CourseSection(
            courseSectionId: 3,
            courseSectionTitle: 'Lesson 2',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lesson 2 Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.document,
                courseMaterialTitle: 'Download the notes',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.quiz,
                courseMaterialTitle: 'Lesson 2 Quizzes',
                duration: '03.00 mins',
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 3,
        courseType: CourseType.premium,
        courseImage:
            'https://img.freepik.com/premium-photo/japan-illustration-ai-generated_201606-7376.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696896000&semt=ais',
        courseName: 'Japanese N5 Grammar Course',
        coursePrice: '20000 MMK',
        courseTotalDurationInHours: 10,
        courseInstructorImage:
            'https://www.studykyoto.jp/wp/wp-content/uploads/2020/10/student_zhang04.jpg',
        courseInstructorName: 'Tr. Hnin',
        courseInstructorMajor: 'YUFL Japanese',
        courseInstructorDescription:
            'Tr. Hnin is a highly experienced Japanese language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in Japanese, Tr. Hsu has been a valuable member of our team. Known for making Japanese learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        courseLanguageCategory: 'Japanese',
        courseLevel: 'Beginner',
        courseSkill: 'Grammar',
        coursePreviewVideo: Uri(
          scheme: 'https',
          host: 'assets.mixkit.co',
          path:
              '/videos/preview/mixkit-time-lapse-of-a-street-and-mount-fuji-30148-large.mp4',
        ),
        courseSections: [
          CourseSection(
            courseSectionId: 1,
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Introduction to the course',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lessons Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Goals & Grammar List',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Classroom Vocabulary',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.document,
                courseMaterialTitle: 'Download the textbook',
              ),
            ],
          ),
          CourseSection(
            courseSectionId: 2,
            courseSectionTitle: 'Lesson 1',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lesson 1 Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.quiz,
                courseMaterialTitle: 'Lesson 1 Quizzes',
                duration: '03.00 mins',
              ),
            ],
          ),
          CourseSection(
            courseSectionId: 3,
            courseSectionTitle: 'Lesson 2',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lesson 2 Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.document,
                courseMaterialTitle: 'Download the notes',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.quiz,
                courseMaterialTitle: 'Lesson 2 Quizzes',
                duration: '03.00 mins',
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 4,
        courseType: CourseType.premium,
        courseImage:
            'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2021/07/how-to-become-a-writer.png',
        courseName: 'Intermediate English Writing Course',
        coursePrice: '50000 MMK',
        courseTotalDurationInHours: 10,
        courseInstructorImage:
            'https://motto-jp.com/media/wp-content/uploads/2021/04/AdobeStock_74877484.jpeg',
        courseInstructorName: 'Tr. Phyo',
        courseInstructorMajor: 'YUFL English',
        courseInstructorDescription:
            'Tr. Phyo is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        courseLanguageCategory: 'English',
        courseLevel: 'Intermediate',
        courseSkill: 'Writing',
        coursePreviewVideo: Uri(
          scheme: 'https',
          host: 'assets.mixkit.co',
          path:
              '/videos/preview/mixkit-young-woman-working-remotely-4957-large.mp4',
        ),
        courseSections: [
          CourseSection(
            courseSectionId: 1,
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Introduction to the course',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lessons Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Goals & Grammar List',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Classroom Vocabulary',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.document,
                courseMaterialTitle: 'Download the textbook',
              ),
            ],
          ),
          CourseSection(
            courseSectionId: 2,
            courseSectionTitle: 'Lesson 1',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lesson 1 Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.quiz,
                courseMaterialTitle: 'Lesson 1 Quizzes',
                duration: '03.00 mins',
              ),
            ],
          ),
          CourseSection(
            courseSectionId: 3,
            courseSectionTitle: 'Lesson 2',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Lesson 2 Overview',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: CourseMaterialType.video,
                courseMaterialTitle: 'Video',
                duration: '03.00 mins',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: CourseMaterialType.document,
                courseMaterialTitle: 'Download the notes',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: CourseMaterialType.quiz,
                courseMaterialTitle: 'Lesson 2 Quizzes',
                duration: '03.00 mins',
              ),
            ],
          ),
        ],
      ),
    );
    return courses;
  }

  static List<Course> getFreeCourses() {
    return getCourses()
        .where((course) => course.courseType == CourseType.free)
        .toList();
  }

  static List<Course> getPremiumCourses() {
    return getCourses()
        .where((course) => course.courseType == CourseType.premium)
        .toList();
  }
}
