import 'package:logger/logger.dart';

class ProjectLogPrinter extends LogPrinter {
  final String className;
  ProjectLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    return [color!('$emoji $className - ${event.message}')];
  }
}

Logger getLogger(String className) {
  return Logger(printer: ProjectLogPrinter(className));
}
