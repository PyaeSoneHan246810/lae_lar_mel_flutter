import 'package:lae_lar_mel_app/app/models/course_instructor_model.dart';
import 'package:lae_lar_mel_app/app/models/course_section_model.dart';
import 'package:lae_lar_mel_app/app/models/course_material_model.dart';
import 'package:hive/hive.dart';
import 'package:lae_lar_mel_app/app/models/quiz_option_model.dart';
import 'package:lae_lar_mel_app/app/models/quiz_question_model.dart';

part 'course_model.g.dart';

@HiveType(typeId: 1)
class Course {
  @HiveField(0)
  int courseId;
  @HiveField(1)
  String courseName;
  @HiveField(2)
  String courseType;
  @HiveField(3)
  double coursePriceInMMK;
  @HiveField(4)
  double courseTotalDurationInHour;
  @HiveField(5)
  CourseInstructor courseInstructor;
  @HiveField(6)
  String courseLanguage;
  @HiveField(7)
  String courseLevel;
  @HiveField(8)
  String courseSkill;
  @HiveField(9)
  String coursePreviewImage;
  @HiveField(10)
  String coursePreviewVideo;
  @HiveField(11)
  List<CourseSection> courseSections;
  Course({
    required this.courseId,
    required this.courseName,
    required this.courseType,
    required this.coursePriceInMMK,
    required this.courseTotalDurationInHour,
    required this.courseInstructor,
    required this.courseLanguage,
    required this.courseLevel,
    required this.courseSkill,
    required this.coursePreviewImage,
    required this.coursePreviewVideo,
    required this.courseSections,
  });
  static List<Course> getCourses() {
    List<Course> courses = [];
    courses.add(
      Course(
        courseId: 1,
        courseName: 'Basic English Grammar Course',
        courseType: "free",
        coursePriceInMMK: 0.0,
        courseTotalDurationInHour: 2.0,
        courseInstructor: CourseInstructor(
          courseInstructorName: 'Tr. Hsu',
          courseInstructorImage:
              'https://www.studykyoto.jp/wp/wp-content/uploads/2020/10/student_zhang04.jpg',
          courseInstructorMajor: 'YUFL English',
          courseInstructorDescription:
              'Tr. Hsu is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'Beginner',
        courseSkill: 'Grammar',
        coursePreviewImage:
            'https://m.economictimes.com/thumb/msid-77058712,width-1200,height-900,resizemode-4,imgsize-172210/english_istock.jpg',
        coursePreviewVideo: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Goals & Grammar List',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Classroom Vocabulary',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Download the textbook',
                content:
                    'https://ismailabdi.files.wordpress.com/2018/02/basic-english-grammar.pdf',
              ),
            ],
          ),
          CourseSection(
            courseSectionTitle: 'Lesson 1',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lesson 1 Overview',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Lesson 1 Quizzes',
                durationInMinute: 03.00,
                content: [
                  QuizQuestion(
                    title: "Which sentence is grammatically correct?",
                    options: [
                      QuizOption(
                        text: "She don't like pizza.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "She doesn't likes pizza.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "She doesn't like pizza.",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "She not like pizza.",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title: "Which of the following words is an adjective?",
                    options: [
                      QuizOption(
                        text: "Quickly",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Blue",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "Running",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Jumped",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title: "Which sentence is written in the passive voice?",
                    options: [
                      QuizOption(
                        text: "The cat chased the mouse.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The mouse was chased by the cat.",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "The mouse chased the cat.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The cat is chasing the mouse.",
                        isCorrect: false,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CourseSection(
            courseSectionTitle: 'Lesson 2',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lesson 2 Overview',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "document",
                courseMaterialTitle: 'Download the notes',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Lesson 2 Quizzes',
                durationInMinute: 03.00,
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 2,
        courseName: 'Daily English Conversations',
        courseType: "free",
        coursePriceInMMK: 0.0,
        courseTotalDurationInHour: 2.0,
        courseInstructor: CourseInstructor(
          courseInstructorName: 'Tr. May',
          courseInstructorImage:
              'https://motto-jp.com/media/wp-content/uploads/2021/04/AdobeStock_74877484.jpeg',
          courseInstructorMajor: 'YUFL English',
          courseInstructorDescription:
              'Tr. May is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'Beginner',
        courseSkill: 'Speaking',
        coursePreviewImage:
            'https://teaching.weblogs.anu.edu.au/files/2023/05/Speaking-English862x485.jpg',
        coursePreviewVideo: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Goals & Grammar List',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Classroom Vocabulary',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Download the textbook',
              ),
            ],
          ),
          CourseSection(
            courseSectionTitle: 'Lesson 1',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lesson 1 Overview',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Lesson 1 Quizzes',
                durationInMinute: 03.00,
              ),
            ],
          ),
          CourseSection(
            courseSectionTitle: 'Lesson 2',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lesson 2 Overview',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/WaQWL1Qr9i8?si=v__hsgmXa9QpzNvx',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "document",
                courseMaterialTitle: 'Download the notes',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Lesson 2 Quizzes',
                durationInMinute: 03.00,
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 3,
        courseName: 'Japanese N5 Grammar Course',
        courseType: "premium",
        coursePriceInMMK: 3000.0,
        courseTotalDurationInHour: 10.0,
        courseInstructor: CourseInstructor(
          courseInstructorName: 'Tr. Hnin',
          courseInstructorImage:
              'https://www.studykyoto.jp/wp/wp-content/uploads/2020/10/student_zhang04.jpg',
          courseInstructorMajor: 'YUFL Japanese',
          courseInstructorDescription:
              'Tr. Hnin is a highly experienced Japanese language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in Japanese, Tr. Hsu has been a valuable member of our team. Known for making Japanese learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'Japanese',
        courseLevel: 'N5',
        courseSkill: 'Grammar',
        coursePreviewImage:
            'https://img.freepik.com/premium-photo/japan-illustration-ai-generated_201606-7376.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696896000&semt=ais',
        coursePreviewVideo: '874742058',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Goals & Grammar List',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Classroom Vocabulary',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Download the textbook',
              ),
            ],
          ),
          CourseSection(
            courseSectionTitle: 'Lesson 1',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lesson 1 Overview',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Lesson 1 Quizzes',
                durationInMinute: 03.00,
              ),
            ],
          ),
          CourseSection(
            courseSectionTitle: 'Lesson 2',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lesson 2 Overview',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "document",
                courseMaterialTitle: 'Download the notes',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Lesson 2 Quizzes',
                durationInMinute: 03.00,
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 4,
        courseName: 'Intermediate English Writing Course',
        courseType: "premium",
        coursePriceInMMK: 5000.0,
        courseTotalDurationInHour: 10.0,
        courseInstructor: CourseInstructor(
          courseInstructorName: 'Tr. Phyo',
          courseInstructorImage:
              'https://motto-jp.com/media/wp-content/uploads/2021/04/AdobeStock_74877484.jpeg',
          courseInstructorMajor: 'YUFL English',
          courseInstructorDescription:
              'Tr. Phyo is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'Intermediate',
        courseSkill: 'Writing',
        coursePreviewImage:
            'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2021/07/how-to-become-a-writer.png',
        coursePreviewVideo: '874742058',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Goals & Grammar List',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Classroom Vocabulary',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Download the textbook',
              ),
            ],
          ),
          CourseSection(
            courseSectionTitle: 'Lesson 1',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lesson 1 Overview',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Lesson 1 Quizzes',
                durationInMinute: 03.00,
              ),
            ],
          ),
          CourseSection(
            courseSectionTitle: 'Lesson 2',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lesson 2 Overview',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '874742058',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "document",
                courseMaterialTitle: 'Download the notes',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Lesson 2 Quizzes',
                durationInMinute: 03.00,
              ),
            ],
          ),
        ],
      ),
    );
    return courses;
  }

  //free courses
  static List<Course> getFreeCourses() {
    List<Course> freeCourses =
        getCourses().where((course) => course.courseType == "free").toList();
    return freeCourses.reversed.toList();
  }

  //premium courses
  static List<Course> getPremiumCourses() {
    List<Course> premiumCourses =
        getCourses().where((course) => course.courseType == "premium").toList();
    return premiumCourses.reversed.toList();
  }

  //beginner english courses
  static List<Course> getBeginnerEnglishCourses() {
    List<Course> beginnerEnglishCourses = getCourses()
        .where((course) =>
            course.courseLevel == 'Beginner' &&
            course.courseLanguage == 'English')
        .toList();
    return beginnerEnglishCourses.reversed.toList();
  }

  //intermediate english courses
  static List<Course> getIntermediateEnglishCourses() {
    List<Course> intermediateEnglishCourses = getCourses()
        .where((course) =>
            course.courseLevel == 'Intermediate' &&
            course.courseLanguage == 'English')
        .toList();
    return intermediateEnglishCourses.reversed.toList();
  }

  //advanced english courses
  static List<Course> getAdvancedEnglishCourses() {
    List<Course> advancedEnglishCourses = getCourses()
        .where((course) =>
            course.courseLevel == 'Advanced' &&
            course.courseLanguage == 'English')
        .toList();
    return advancedEnglishCourses.reversed.toList();
  }

  //advanced ielts courses
  static List<Course> getIeltsEnglishCourses() {
    List<Course> ieltsEnglishCourses = getCourses()
        .where((course) =>
            course.courseLevel == 'IELTS' && course.courseLanguage == 'English')
        .toList();
    return ieltsEnglishCourses.reversed.toList();
  }
}
