import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:qwys/data/data.dart';
import 'package:qwys/features/features.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final talker = TalkerFlutter.init();

  getIt.registerSingleton<Talker>(talker);

  // Network
  getIt
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<DioClient>(
      () => DioClient(
        dio: getIt<Dio>(),
        talker: getIt<Talker>(),
      ),
    )

    // Quiz
    ..registerLazySingleton(
      () => QuizRemoteDatasource(
        dioClient: getIt<DioClient>(),
      ),
    )
    ..registerLazySingleton(
      () => QuizRepository(getIt<QuizRemoteDatasource>()),
    )
    ..registerLazySingleton(
      () => GetQuizzesUsecase(getIt<QuizRepository>()),
    )
    ..registerLazySingleton(
      () => GetQuizUsecase(getIt<QuizRepository>()),
    )
    ..registerFactory(
      () => QuizzesBloc(
        getQuizzesUsecase: getIt<GetQuizzesUsecase>(),
        talker: getIt<Talker>(),
      ),
    )
    ..registerFactory(
      () => QuizBloc(
        getQuizUsecase: getIt<GetQuizUsecase>(),
        talker: getIt<Talker>(),
      ),
    );
}
