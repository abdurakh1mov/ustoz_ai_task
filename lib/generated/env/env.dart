import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: "FIREBASE_KEY")
  static String yandexKey = _Env.yandexKey;
  @EnviedField(varName: "BASE_URL")
  static String baseUrlProd = _Env.baseUrlProd;
}
