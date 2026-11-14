import 'package:flutter/material.dart';
import 'package:qwys/core/core.dart';

class AppVersion extends StatefulWidget {
  const AppVersion({super.key});

  @override
  State<AppVersion> createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
  late final Future<String> _version;

  @override
  void initState() {
    super.initState();
    _version = VersionUtils.currentVersion;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colors;

    return FutureBuilder<String>(
      future: _version,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        return Text(
          'v${snapshot.data}',
          style: textTheme.labelMedium?.copyWith(
            color: colors.textIconSecondaryDefault,
          ),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
