void main(List<String> args) {
  Future myFuture  = Future(() {
    print("Going back to the future");
    return 0;
  }).then((value) => print("The value is $value"));

  Future<int> myFutureFunc() async{
    print("I have a function in the future");
    await Future.delayed(Duration(seconds: 5));
    return 12;
  }

  myFutureFunc().then((value) => print("Ny functions valeu is: $value"));

  print("Done with main");
}