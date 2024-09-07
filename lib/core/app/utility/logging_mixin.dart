import 'package:logger/logger.dart';

mixin LogMixin {
  Logger _logger() {
    return Logger(
      printer: CustomPrinter(
        runtimeType.toString(),
      ),
      level: Level.all,
    );
  }

  Logger get logger => _logger();
}

class CustomPrinter extends LogPrinter {
  final String className;

  CustomPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.defaultLevelColors[event.level];
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final message = event.message;
    final time = event.time;

    return [color!('[$emoji $className] [${event.level.name.toUpperCase()}] $message Time:$time')];
  }
}
