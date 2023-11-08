import 'package:flutter/cupertino.dart';
import 'package:lae_lar_mel_app/app/models/course_instructor_model.dart';
import 'package:lae_lar_mel_app/app/models/course_section_model.dart';
import 'package:lae_lar_mel_app/app/models/course_material_model.dart';
import 'package:hive/hive.dart';
import 'package:lae_lar_mel_app/app/models/quiz_option_model.dart';
import 'package:lae_lar_mel_app/app/models/quiz_question_model.dart';
import 'package:provider/provider.dart';
import '../providers/course_enrollment_provider.dart';

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

  //get all courses
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
          courseInstructorMajor: 'English Instructor',
          courseInstructorDescription:
              'Tr. Hsu is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'Beginner',
        courseSkill: 'Grammar',
        coursePreviewImage:
            'https://m.economictimes.com/thumb/msid-77058712,width-1200,height-900,resizemode-4,imgsize-172210/english_istock.jpg',
        coursePreviewVideo: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Goals & Grammar List',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Classroom Vocabulary',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
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
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Quizzes',
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
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
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
              'https://www.studykyoto.jp/wp/wp-content/uploads/2020/10/student_zhang04.jpg',
          courseInstructorMajor: 'English Instructor',
          courseInstructorDescription:
              'Tr. May is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'Beginner',
        courseSkill: 'Speaking',
        coursePreviewImage:
            'https://teaching.weblogs.anu.edu.au/files/2023/05/Speaking-English862x485.jpg',
        coursePreviewVideo: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Document',
                content:
                    'https://learningandwork.org.uk/wp-content/uploads/2020/06/English-Conversation-Practice-Toolkit.pdf',
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
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Quizzes',
                durationInMinute: 03.00,
                content: [
                  QuizQuestion(
                    title:
                        "What is a common way to suggest meeting up with a friend in the evening?",
                    options: [
                      QuizOption(
                        text: "Let's meet at 8:00 AM",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "How about meeting at the park?",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "I'm not sure",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Can I borrow your book?",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title:
                        "What should you say to thank the waiter after your meal is served?",
                    options: [
                      QuizOption(
                        text: "Go away",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Thank you",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "Give me more",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "No, thanks",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title:
                        "What is the polite way to introduce yourself to someone you've just met?",
                    options: [
                      QuizOption(
                        text: "I don't know",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "No",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Hi, my name is John. Nice to meet you.",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "What's your address?",
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
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: 'https://youtu.be/LcGaMWal6Gk?si=Zr_h2D5b5OVIlT1d',
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 3,
        courseName: 'Reported Speech',
        courseType: "premium",
        coursePriceInMMK: 3000.0,
        courseTotalDurationInHour: 2.0,
        courseInstructor: CourseInstructor(
          courseInstructorName: 'Tr. May',
          courseInstructorImage:
              'https://motto-jp.com/media/wp-content/uploads/2021/04/AdobeStock_74877484.jpeg',
          courseInstructorMajor: 'English Instructor',
          courseInstructorDescription:
              'Tr. May is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'Intermediate',
        courseSkill: 'Grammar',
        coursePreviewImage:
            'https://asset-a.grid.id/crop/300x200:2700x1800/x/photo/2023/02/01/7118856_3288524jpg-20230201020734.jpg',
        coursePreviewVideo: '882474323',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Document',
                content:
                    'https://www.perfect-english-grammar.com/support-files/reported_speech_explanation.pdf',
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
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Quizzes',
                durationInMinute: 03.00,
                content: [
                  QuizQuestion(
                    title: "She said, \"I love watching movies.\"",
                    options: [
                      QuizOption(
                        text: "She said she loves watching movies.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "She said she loving watching movies",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "She said she loved watching movies. ",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "She said she loves watch movies.",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title: "Mary wondered, \"Will it rain tomorrow?\"",
                    options: [
                      QuizOption(
                        text: "Mary wondered if it would rain tomorrow.",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "Mary wondered if it will rain tomorrow.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Mary wondered will it rain tomorrow.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Mary wondered whether it will rain tomorrow.",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title: "The teacher said, \"Please sit down.\"",
                    options: [
                      QuizOption(
                        text: "The teacher said to sit down, please.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The teacher said to sit down.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The teacher said please to sit down.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The teacher asked them to sit down. ",
                        isCorrect: true,
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
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
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
        coursePriceInMMK: 3000.0,
        courseTotalDurationInHour: 2.0,
        courseInstructor: CourseInstructor(
          courseInstructorName: 'Tr. Phyo',
          courseInstructorImage:
              'https://motto-jp.com/media/wp-content/uploads/2021/04/AdobeStock_74877484.jpeg',
          courseInstructorMajor: 'English Instructor',
          courseInstructorDescription:
              'Tr. Phyo is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'Intermediate',
        courseSkill: 'Writing',
        coursePreviewImage:
            'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2021/07/how-to-become-a-writer.png',
        coursePreviewVideo: '882474323',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Document',
                content:
                    'https://aaronsnowberger.com/pew/assets/files/book1/pew-i-v2.2-final-screen.pdf',
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
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Quizzes',
                durationInMinute: 03.00,
                content: [
                  QuizQuestion(
                    title:
                        "Which of the following sentences has a comma splice error?",
                    options: [
                      QuizOption(
                        text: "She loves reading books, especially novels.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "He went to the store, but he forgot his wallet.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text:
                            "They decided to watch a movie, they chose a comedy.",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "She is a good singer, and she plays the guitar.",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title:
                        "Which of the following sentences is the best way to paraphrase this sentence: \"The boy ran across the street.\"",
                    options: [
                      QuizOption(
                        text: "The boy crossed the street by running.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The boy sprinted over the street.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The boy jogged through the street.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The boy dashed to the other side of the street.",
                        isCorrect: true,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title:
                        "Which of the following sentences is grammatically correct?",
                    options: [
                      QuizOption(
                        text: "She don’t like chocolate cake.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "He likes chocolate cake very much.",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "They likes chocolate cake a lot.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "I no like chocolate cake.",
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
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 5,
        courseName: 'Writing for Publication',
        courseType: "premium",
        coursePriceInMMK: 5000.0,
        courseTotalDurationInHour: 4.0,
        courseInstructor: CourseInstructor(
          courseInstructorName: 'Tr. Nyein',
          courseInstructorImage:
              'https://motto-jp.com/media/wp-content/uploads/2021/04/AdobeStock_74877484.jpeg',
          courseInstructorMajor: 'English Instructor',
          courseInstructorDescription:
              'Tr. Nyein is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'Advanced',
        courseSkill: 'Writing',
        coursePreviewImage:
            'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2022/05/Writing-Careers.jpg',
        coursePreviewVideo: '882474323',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Document',
                content:
                    'https://www.emgywomenscollege.ac.in/templateEditor/kcfinder/upload/files/Writing%20for%20Publication.pdf',
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
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Quizzes',
                durationInMinute: 03.00,
                content: [
                  QuizQuestion(
                    title:
                        "Choose the correct sentence to avoid a subject-verb agreement error.",
                    options: [
                      QuizOption(
                        text: "The results of the study was surprising.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The results of the study been surprising.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The results of the study are surprising. ",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "The results of the study is surprising.",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title:
                        "Which of the following is an appropriate way to start an introduction for an opinion piece?",
                    options: [
                      QuizOption(
                        text:
                            "In this article, I will discuss various viewpoints.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "The topic of this article is quite interesting.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text:
                            "In today's fast-paced world, it's essential to address the issue of...",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text:
                            "Have you ever wondered about the impact of climate change on our environment?",
                        isCorrect: true,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title:
                        "Identify the sentence with a correct use of hyphens.",
                    options: [
                      QuizOption(
                        text:
                            "It's a well-known fact that good grammar is important.",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text:
                            "It's a well known fact that good-grammar is important.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text:
                            "It's a well-known fact that good grammar is-important.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text:
                            "It's a well-known fact that good-grammar is-important.",
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
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
            ],
          ),
        ],
      ),
    );
    courses.add(
      Course(
        courseId: 6,
        courseName: 'Listening Strategies and Note-Taking Skills',
        courseType: "premium",
        coursePriceInMMK: 5000.0,
        courseTotalDurationInHour: 4.0,
        courseInstructor: CourseInstructor(
          courseInstructorName: 'Tr. Aye',
          courseInstructorImage:
              'https://motto-jp.com/media/wp-content/uploads/2021/04/AdobeStock_74877484.jpeg',
          courseInstructorMajor: 'English Instructor',
          courseInstructorDescription:
              'Tr. Aye is a highly experienced English language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in English, Tr. Hsu has been a valuable member of our team. Known for making English learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
        ),
        courseLanguage: 'English',
        courseLevel: 'IELTS',
        courseSkill: 'Listening',
        coursePreviewImage:
            'https://www.simplypsychology.org/wp-content/uploads/two-people-actively-listening-768x620.jpeg',
        coursePreviewVideo: '882474323',
        courseSections: [
          CourseSection(
            courseSectionTitle: 'Introduction',
            courseMaterials: [
              CourseMaterial(
                courseMaterialId: 1,
                courseMaterialType: "video",
                courseMaterialTitle: 'Introduction to the course',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Lessons Overview',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "document",
                courseMaterialTitle: 'Document',
                content:
                    'https://www.jmu.edu/first-gen/valleyscholars/_files/listennotes.pdf',
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
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "quiz",
                courseMaterialTitle: 'Quizzes',
                durationInMinute: 03.00,
                content: [
                  QuizQuestion(
                    title:
                        "Which of the following is NOT a good note-taking strategy during the IELTS listening test?",
                    options: [
                      QuizOption(
                        text: "Trying to write down every word you hear. ",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "Using symbols and abbreviations to save time.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Focusing on key information and main ideas.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Organizing your notes in a structured way.",
                        isCorrect: false,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title:
                        "How can you improve your listening comprehension when practicing with audio materials?",
                    options: [
                      QuizOption(
                        text: "Listening passively without taking any notes.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text:
                            "Replaying the audio multiple times until you understand every word.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text:
                            "Distracting yourself with other tasks while listening.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text:
                            "Actively engaging with the material, and trying to understand the context.",
                        isCorrect: true,
                      ),
                    ],
                  ),
                  QuizQuestion(
                    title:
                        "What can you do to improve your ability to predict the content of a listening passage?",
                    options: [
                      QuizOption(
                        text: "Randomly guess what the topic might be.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Skip the first few minutes of the audio.",
                        isCorrect: false,
                      ),
                      QuizOption(
                        text: "Read the questions carefully before listening. ",
                        isCorrect: true,
                      ),
                      QuizOption(
                        text: "Close your eyes to focus solely on the audio.",
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
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 2,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 3,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 4,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
              CourseMaterial(
                courseMaterialId: 5,
                courseMaterialType: "video",
                courseMaterialTitle: 'Video',
                durationInMinute: 03.00,
                content: '882476919',
              ),
            ],
          ),
        ],
      ),
    );
    // courses.add(
    //   Course(
    //     courseId: 3,
    //     courseName: 'Japanese N5 Grammar Course',
    //     courseType: "premium",
    //     coursePriceInMMK: 3000.0,
    //     courseTotalDurationInHour: 10.0,
    //     courseInstructor: CourseInstructor(
    //       courseInstructorName: 'Tr. Hnin',
    //       courseInstructorImage:
    //           'https://www.studykyoto.jp/wp/wp-content/uploads/2020/10/student_zhang04.jpg',
    //       courseInstructorMajor: 'YUFL Japanese',
    //       courseInstructorDescription:
    //           'Tr. Hnin is a highly experienced Japanese language instructor at YUFl. With a passion for teaching and a dedication to helping students excel in Japanese, Tr. Hsu has been a valuable member of our team. Known for making Japanese learning engaging and effective, students love her classes. Tr. Hsu also enjoys reading, traveling, and exploring the beauty of language and culture.',
    //     ),
    //     courseLanguage: 'Japanese',
    //     courseLevel: 'N5',
    //     courseSkill: 'Grammar',
    //     coursePreviewImage:
    //         'https://img.freepik.com/premium-photo/japan-illustration-ai-generated_201606-7376.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696896000&semt=ais',
    //     coursePreviewVideo: '874742058',
    //     courseSections: [
    //       CourseSection(
    //         courseSectionTitle: 'Introduction',
    //         courseMaterials: [
    //           CourseMaterial(
    //             courseMaterialId: 1,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Introduction to the course',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 2,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Lessons Overview',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 3,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Goals & Grammar List',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 4,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Classroom Vocabulary',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 5,
    //             courseMaterialType: "document",
    //             courseMaterialTitle: 'Download the textbook',
    //           ),
    //         ],
    //       ),
    //       CourseSection(
    //         courseSectionTitle: 'Lesson 1',
    //         courseMaterials: [
    //           CourseMaterial(
    //             courseMaterialId: 1,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Lesson 1 Overview',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 2,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Video',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 3,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Video',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 4,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Video',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 5,
    //             courseMaterialType: "quiz",
    //             courseMaterialTitle: 'Lesson 1 Quizzes',
    //             durationInMinute: 03.00,
    //           ),
    //         ],
    //       ),
    //       CourseSection(
    //         courseSectionTitle: 'Lesson 2',
    //         courseMaterials: [
    //           CourseMaterial(
    //             courseMaterialId: 1,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Lesson 2 Overview',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 2,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Video',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 3,
    //             courseMaterialType: "video",
    //             courseMaterialTitle: 'Video',
    //             durationInMinute: 03.00,
    //             content: '874742058',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 4,
    //             courseMaterialType: "document",
    //             courseMaterialTitle: 'Download the notes',
    //           ),
    //           CourseMaterial(
    //             courseMaterialId: 5,
    //             courseMaterialType: "quiz",
    //             courseMaterialTitle: 'Lesson 2 Quizzes',
    //             durationInMinute: 03.00,
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
    return courses;
  }

  //get enrolled courses
  static List<Course> getEnrolledCourses(BuildContext context) {
    final courseEnrollmentProvider =
        Provider.of<CourseEnrollmentProvider>(context);
    Map<int, bool> enrolledCourses = courseEnrollmentProvider.enrolledCourses;
    List<Course> enrolledCourseData = getCourses().where((course) {
      return enrolledCourses.containsKey(course.courseId) &&
          enrolledCourses[course.courseId] == true;
    }).toList();
    return enrolledCourseData.reversed.toList();
  }

  //get free courses
  static List<Course> getFreeCourses() {
    List<Course> freeCourses =
        getCourses().where((course) => course.courseType == "free").toList();
    return freeCourses.reversed.toList();
  }

  //get premium courses
  static List<Course> getPremiumCourses() {
    List<Course> premiumCourses =
        getCourses().where((course) => course.courseType == "premium").toList();
    return premiumCourses.reversed.toList();
  }

  //get beginner english courses
  static List<Course> getBeginnerEnglishCourses() {
    List<Course> beginnerEnglishCourses = getCourses()
        .where((course) =>
            course.courseLevel == 'Beginner' &&
            course.courseLanguage == 'English')
        .toList();
    return beginnerEnglishCourses.reversed.toList();
  }

  //get intermediate english courses
  static List<Course> getIntermediateEnglishCourses() {
    List<Course> intermediateEnglishCourses = getCourses()
        .where((course) =>
            course.courseLevel == 'Intermediate' &&
            course.courseLanguage == 'English')
        .toList();
    return intermediateEnglishCourses.reversed.toList();
  }

  //get advanced english courses
  static List<Course> getAdvancedEnglishCourses() {
    List<Course> advancedEnglishCourses = getCourses()
        .where((course) =>
            course.courseLevel == 'Advanced' &&
            course.courseLanguage == 'English')
        .toList();
    return advancedEnglishCourses.reversed.toList();
  }

  //get ielts english courses
  static List<Course> getIeltsEnglishCourses() {
    List<Course> ieltsEnglishCourses = getCourses()
        .where((course) =>
            course.courseLevel == 'IELTS' && course.courseLanguage == 'English')
        .toList();
    return ieltsEnglishCourses.reversed.toList();
  }

  //get n5 japanese courses
  static List<Course> getN5JapaneseCourses() {
    List<Course> n5JapaneseCourses = getCourses()
        .where((course) =>
    course.courseLevel == 'N5' && course.courseLanguage == 'Japanese')
        .toList();
    return n5JapaneseCourses.reversed.toList();
  }

  //get n4 japanese courses
  static List<Course> getN4JapaneseCourses() {
    List<Course> n4JapaneseCourses = getCourses()
        .where((course) =>
    course.courseLevel == 'N4' && course.courseLanguage == 'Japanese')
        .toList();
    return n4JapaneseCourses.reversed.toList();
  }

  //get n3 japanese courses
  static List<Course> getN3JapaneseCourses() {
    List<Course> n3JapaneseCourses = getCourses()
        .where((course) =>
    course.courseLevel == 'N3' && course.courseLanguage == 'Japanese')
        .toList();
    return n3JapaneseCourses.reversed.toList();
  }

  //get n2 japanese courses
  static List<Course> getN2JapaneseCourses() {
    List<Course> n2JapaneseCourses = getCourses()
        .where((course) =>
    course.courseLevel == 'N2' && course.courseLanguage == 'Japanese')
        .toList();
    return n2JapaneseCourses.reversed.toList();
  }

  //get n1 japanese courses
  static List<Course> getN1JapaneseCourses() {
    List<Course> n1JapaneseCourses = getCourses()
        .where((course) =>
    course.courseLevel == 'N1' && course.courseLanguage == 'Japanese')
        .toList();
    return n1JapaneseCourses.reversed.toList();
  }
}
