class BotClock {
  Duration? waitTime;

  BotClock({this.waitTime});

  Future clock () {
    return waitTime != null ? Future.delayed(waitTime!) : Future.delayed(Duration(seconds: 0));
  }

  Stream<int> botStream(int interval, [int? maxCount]) async*{
    for(int i = 1; i != maxCount; i++) {
      waitTime = Duration(seconds: interval);
      await clock();
      yield i;
    }
  }
}