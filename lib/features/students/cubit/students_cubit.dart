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
  int displayAnswer = 0;

  void selectCard(int index) {
    currentIndex = index;
    emit(SelectCard(index: currentIndex));
    emit(ChangeColor());
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex(index: currentIndex));
  }

  void displayAnswers(int index) {
    displayAnswer = index;
    isClickOnArrowDown = !isClickOnArrowDown;
    emit(DisplayAnswers(
      isDisplay: isClickOnArrowDown,
      index: displayAnswer,
    ));
  }

  List words = [
    {"title": tr.theStudent, "imageUrl": IconsResources.hatTeacher},
    {"title": tr.degrees, "imageUrl": IconsResources.degree},
  ];

  List<AnswersModel> answers = [
    AnswersModel(
      id: 1,
      name: "${tr.question} 1",
      mark: IconsResources.correct,
      type: "B",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 2",
      mark: IconsResources.wrong,
      type: "A",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 3",
      mark: IconsResources.correct,
      type: "C",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 4",
      mark: IconsResources.correct,
      type: "B",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 5",
      mark: IconsResources.correct,
      type: "A",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 6",
      mark: IconsResources.wrong,
      type: "B",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 7",
      mark: IconsResources.wrong,
      type: "C",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 8",
      mark: IconsResources.correct,
      type: "A",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 9",
      mark: IconsResources.correct,
      type: "B",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 10",
      mark: IconsResources.wrong,
      type: "C",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 11",
      mark: IconsResources.correct,
      type: "A",
    ),
    AnswersModel(
      id: 1,
      name: "${tr.question} 12",
      mark: IconsResources.correct,
      type: "B",
    ),
  ];

  List<ExamModel> exams = [
    ExamModel(
      name: "${tr.test} 1",
      answers: [
        AnswersModel(
          id: 1,
          name: "${tr.question} 1",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 2",
          mark: IconsResources.wrong,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 3",
          mark: IconsResources.correct,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 4",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 5",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 6",
          mark: IconsResources.wrong,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 7",
          mark: IconsResources.wrong,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 8",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 9",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 10",
          mark: IconsResources.wrong,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 11",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 12",
          mark: IconsResources.correct,
          type: "B",
        ),
      ],
    ),
    ExamModel(name: "${tr.test} 2", answers: [
      AnswersModel(
        id: 1,
        name: "${tr.question} 1",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 2",
        mark: IconsResources.wrong,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 3",
        mark: IconsResources.correct,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 4",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 5",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 6",
        mark: IconsResources.wrong,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 7",
        mark: IconsResources.wrong,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 8",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 9",
        mark: IconsResources.correct,
        type: "B",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 10",
        mark: IconsResources.wrong,
        type: "C",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 11",
        mark: IconsResources.correct,
        type: "A",
      ),
      AnswersModel(
        id: 1,
        name: "${tr.question} 12",
        mark: IconsResources.correct,
        type: "B",
      ),
    ]),
    ExamModel(
      name: "${tr.test} 3",
      answers: [
        AnswersModel(
          id: 1,
          name: "${tr.question} 1",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 2",
          mark: IconsResources.wrong,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 3",
          mark: IconsResources.correct,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 4",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 5",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 6",
          mark: IconsResources.wrong,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 7",
          mark: IconsResources.wrong,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 8",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 9",
          mark: IconsResources.correct,
          type: "B",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 10",
          mark: IconsResources.wrong,
          type: "C",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 11",
          mark: IconsResources.correct,
          type: "A",
        ),
        AnswersModel(
          id: 1,
          name: "${tr.question} 12",
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
