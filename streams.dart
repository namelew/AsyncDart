import 'dart:async';

void main(List<String> args) async{
  Stream<int> myStream(int interval, [int? maxCount]) async*{
    for(int i = 1; i != maxCount; i++) {
      print("Couting: $i");
      await Future.delayed(Duration(seconds: interval));
      yield i;
    }
    print("The stream is finished");
  }
  StreamSubscription mySubscriber = myStream(1).listen((event) { 
    if(event.isEven) {
      print("This number is even!");
    }
  }, onError: (e){
    print("A error happended. $e");
  }, onDone: () {
    print("Subscription ends");
  },);

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.pause();
  print("Strean as paused");
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.resume();
  print("Strean as resumed");
  await Future.delayed(Duration(seconds: 3));
  mySubscriber.cancel();
  print("Strean as canceled");
  print("Main is finished");
}