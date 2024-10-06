import 'package:logger/logger.dart';

/// A mixin for logging that provides a logger instance with a custom printer.
mixin LogMixin {
  /// Creates or returns a singleton logger instance.
  Logger _logger() {
    return Logger(
      printer: CustomPrinter(
        className: runtimeType.toString(),
      ),
      level: Level.all,
    );
  }

  Logger get logger => _logger();
}

/// A custom printer for logging messages with additional formatting.
class CustomPrinter extends LogPrinter {
  final String className;

  CustomPrinter({this.className = ''}); // Optionally set a default class name

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.defaultLevelColors[event.level];
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final message = event.message;
    final time = event.time;

    return [
      color!('[$emoji ${className.isNotEmpty ? className : 'LOG'}] '
          '[${event.level.name.toUpperCase()}] $message '
          'Time: ${_formatTime(time)}')
    ];
  }

  /// Formats the log event time into a readable string.
  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute}:${time.second}';
  }
}
