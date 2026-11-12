import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qwys/core/core.dart';
import 'package:qwys/core/i18n/strings.g.dart';
import 'package:qwys/features/features.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key, required this.quiz});

  final QuizEntity quiz;

  static const double _iconSize = 16;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onTap: () => context.push('/quiz/${quiz.id}'),
      child: Column(
        spacing: mPadding,
        children: [
          _buildHeader(context),
          _buildMainContent(context),
          AppDivider(),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = Theme.of(context).colors;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      spacing: xsPadding,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            quiz.categoryName,
            style: textTheme.labelMedium?.copyWith(
              color: colors.textIconPrimaryDefault,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        AppBadge(
          title: quiz.difficulty,
          badgeSize: BadgeSize.small,
        ),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final colors = Theme.of(context).colors;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quiz.title,
          style: textTheme.titleLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (quiz.description != null && quiz.description!.isNotEmpty)
          Text(
            quiz.description!,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.textIconSecondaryDefault,
            ),
          ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      spacing: mPadding,
      children: [
        if (quiz.questionCount != null)
          _buildMetadata(
            context,
            icon: Icons.quiz_outlined,
            label: t.quizzes.questions_num(n: quiz.questionCount!),
          ),
        _buildMetadata(
          context,
          icon: Icons.play_arrow_rounded,
          label: t.quizzes.plays_num(n: quiz.plays),
        ),
      ],
    );
  }

  Widget _buildMetadata(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    final colors = Theme.of(context).colors;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      spacing: sPadding,
      children: [
        Icon(
          icon,
          size: _iconSize,
          color: colors.textIconSecondaryDefault,
        ),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colors.textIconSecondaryDefault,
          ),
        ),
      ],
    );
  }
}
