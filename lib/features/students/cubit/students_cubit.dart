import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/students/models/answers_model.dart';
import 'package:teacher/features/students/models/exam_model.dart';
import 'package:teacher/features/students/models/student_model.dart';
import 'package:teacher/my_app.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/resources/image_resources.dart';

part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  StudentsCubit() : super(StudentsInitial());
  static final StudentsCubit _studentsCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static StudentsCubit get instance => _studentsCubit;

  bool isClickOnArrowDown = false;

  int currentIndex = 0;

  

  void selectCard(int index) {
    currentIndex = index;
    emit(SelectCard(index: currentIndex));
    emit(ChangeColor());
  }

  void displayAnswers() {
    isClickOnArrowDown = !isClickOnArrowDown;
    emit(DisplayAnswers(isDisplay: isClickOnArrowDown));
    emit(ChangeColor());
  }

  List words = [
    {"title": tr.student, "imageUrl": IconsResources.hatTeacher},
    {"title": tr.degrees, "imageUrl": IconsResources.degree},
  ];

  List<AnswersModel>  answers = [
      AnswersModel(
        id: 1,
        name: "السؤال 1",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 2",
        mark: IconsResources.wrong,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 3",
        mark: IconsResources.correct,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 4",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 5",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 6",
        mark: IconsResources.wrong,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 7",
        mark: IconsResources.wrong,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 8",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 9",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 10",
        mark: IconsResources.wrong,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 11",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 12",
        mark: IconsResources.correct,
        type: "B",
      ),
    ];

  List<ExamModel> exams = [
    ExamModel(
      name: "الاختبار 1",
      answers: [
        AnswersModel(
          id: 1,
          name: "السؤال 1",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 2",
          mark: IconsResources.wrong,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 3",
          mark: IconsResources.correct,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 4",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 5",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 6",
          mark: IconsResources.wrong,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 7",
          mark: IconsResources.wrong,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 8",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 9",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 10",
          mark: IconsResources.wrong,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 11",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 12",
          mark: IconsResources.correct,
          type: "B",
        ),
      ],
    ),
    ExamModel(name: "الاختبار 2", answers: [
      AnswersModel(
        id: 1,
        name: "السؤال 1",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 2",
        mark: IconsResources.wrong,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 3",
        mark: IconsResources.correct,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 4",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 5",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 6",
        mark: IconsResources.wrong,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 7",
        mark: IconsResources.wrong,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 8",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 9",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 10",
        mark: IconsResources.wrong,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 11",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "السؤال 12",
        mark: IconsResources.correct,
        type: "B",
      ),
    ]),
    ExamModel(
      name: "الاختبار 3",
      answers: [
        AnswersModel(
          id: 1,
          name: "السؤال 1",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 2",
          mark: IconsResources.wrong,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 3",
          mark: IconsResources.correct,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 4",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 5",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 6",
          mark: IconsResources.wrong,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 7",
          mark: IconsResources.wrong,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 8",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 9",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 10",
          mark: IconsResources.wrong,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 11",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "السؤال 12",
          mark: IconsResources.correct,
          type: "B",
        ),
      ],
    ),
  ];

  

  List<StudentModel> students = [
    StudentModel(
      id: 1,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 2,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
    StudentModel(
      id: 3,
      name: 'بكر',
      image: ImageResources.profile,
      educationalStage: tr.thirdSecondary,
    ),
  ];
}
