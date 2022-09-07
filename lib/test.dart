// TODO: Delete test file
main() {

  A a = A(a: "Ahmad", b: "Jamal");
  print("a: ${a.a}\nb: ${a.b}");

}

class A {
  final String a;
  final String b;

  A({required this.a, this.b = "abc"});
}
