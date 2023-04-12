import 'package:AutoVision/service/admin_service.dart';
import 'package:AutoVision/service/vehicle_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => new VehicleService());
  locator.registerLazySingleton(() => new AdminService());
}
