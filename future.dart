void main(List<String> args) {
  Future<int> myFutureFunc() async{
    print("I have a function in the future");
    await Future.delayed(Duration(seconds: 5));
    throw Exception();
    return 12;
  }

  myFutureFunc()
    .then((value) => print("Ny functions valeu is: $value"))
    .onError((error, stackTrace) => print("An Error occurred"))
    .whenComplete(() => print("The future ends"));

  print("Done with main");
}