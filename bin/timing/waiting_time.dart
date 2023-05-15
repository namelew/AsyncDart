class BotClock {
  Duration waitTime;

  BotClock(this.waitTime);

  Future clock () {
    return Future.delayed(waitTime);
  }
}