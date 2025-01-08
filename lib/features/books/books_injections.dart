import 'package:teacher/app_injections.dart';
import 'package:teacher/features/books/cubit/books_cubit.dart';

void booksInjections(){
  getIt.registerFactory<BooksCubit>(()=>BooksCubit());
}