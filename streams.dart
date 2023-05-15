void main(List<String> args) {
  Stream myStream(int interval, [int? maxCount]) async*{
    for(int i = 1; i != maxCount; i++) {
      print("Couting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i;
    }
    print("The stream is finished");
  }
  myStream(1, 10);
  print("Main is finished");
}