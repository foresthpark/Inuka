import 'package:inuka_app/page/Page.dart';
import 'package:intl/intl.dart';

class Story {
  final String storyName;
  final DateTime utcStart;
  final List<Page> pages;

  int numberTotalQuestions;
  int numberQuestionsCompleted = 0;
  DateTime endTimeOfStory;
  int currentPageIndex = 0;
  String dateStarted;
  String timeStarted;

  String get name {
    return storyName;
  }

  String get time {
    return timeStarted;
  }

  int get completed {
    return numberQuestionsCompleted;
  }

  int get total {
    return numberTotalQuestions;
  }

  int get currentIndex {
    return currentPageIndex;
  }

  Story(
    this.storyName,
    this.utcStart,
    this.pages,
  ) {
    this.numberTotalQuestions = pages.length;
    this.dateStarted = DateFormat("dd / MMMM / yyyy").format(utcStart);
    this.timeStarted = DateFormat("H:mm a").format(utcStart);
  }
}
