import 'package:crypto_currency/MyHome/index.dart';

class MyHomeProvider {
  final MyHomeRepository _myHomeRepository = new MyHomeRepository();

  MyHomeProvider();

  void test() {
    this._myHomeRepository.test();
  }
}
