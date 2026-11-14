import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:qwys/http/data.dart';
import 'package:qwys/features/features.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final talker = TalkerFlutter.init();

  getIt.registerSingleton<Talker>(talker);

  // Network
  getIt
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<DioClient>(() => DioClient(
          dio: getIt<Dio>(),
          talker: getIt<Talker>(),
        ))

    // Quizzes
    ..registerLazySingleton(() => QuizzesRemoteDatasource(
          dioClient: getIt<DioClient>(),
        ))
    ..registerLazySingleton(() => QuizzesRepository(
          getIt<QuizzesRemoteDatasource>(),
        ))
    ..registerLazySingleton(() => GetQuizzesUsecase(
          getIt<QuizzesRepository>(),
        ))
    ..registerFactory(() => QuizzesBloc(
          getQuizzesUsecase: getIt<GetQuizzesUsecase>(),
          talker: getIt<Talker>(),
        ))

    // Questions
    ..registerLazySingleton(() => QuestionsRemoteDatasource(
          dioClient: getIt<DioClient>(),
        ))
    ..registerLazySingleton(() => QuestionsRepository(
          getIt<QuestionsRemoteDatasource>(),
        ))
    ..registerLazySingleton(() => GetQuestionsUsecase(
          getIt<QuestionsRepository>(),
        ))
    ..registerFactory(() => QuestionsBloc(
          getQuestionsUsecase: getIt<GetQuestionsUsecase>(),
          talker: getIt<Talker>(),
        ));
}
