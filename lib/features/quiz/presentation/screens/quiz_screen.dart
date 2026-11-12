import 'package:flutter/material.dart';
import 'package:qwys/di/di.dart';
import 'package:qwys/features/features.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _quizzesBloc = getIt<QuizzesBloc>();

  @override
  void initState() {
    super.initState();

    _quizzesBloc.add(QuizzesLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
