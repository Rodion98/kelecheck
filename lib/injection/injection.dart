import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ud_mobile_app/injection/injection.config.dart';

final getIt = GetIt.instance;
@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  // getIt.registerLazySingleton<SecureStoragePayments>()
}
