void main(List<String> args) {
  Future<int> myFutureErrorFunc(int a, int b) async {
    try {
      if (a > b) {
        throw Exception();
      }
      
      print("I hava a functional function");
      await Future.delayed(Duration(seconds: 5));
      return 42;
    } catch (e) {
      print("A error ocurred");
      return 42;
    } finally {
      print("The future is end");
    }
  }

  myFutureErrorFunc(2, 1).then((value) => print("the value is $value"));

  print("Done with main");
}