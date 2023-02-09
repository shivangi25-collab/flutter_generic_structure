import 'package:get_storage/get_storage.dart';

class SharedPrefs {
  static Future<void> writeValue(String key, dynamic value) async {
    await GetStorage().write(key, value);
  }

  static T read<T>(String key) {
    return GetStorage().read(key);
  }

  static String readStringValue(String key) {
    return GetStorage().read(key) ?? "";
  }

  static bool readBoolValue(String key) {
    return GetStorage().read(key) ?? false;
  }

  static Future<void> clearAll() async {

    await GetStorage().erase();

  }

  static Future<void> remove(String key) async {
    return await GetStorage().remove(key);
  }

  static bool hasCompanyCode() {
    var list = SharedPrefs.read(PrefConstants.COMPANY_CODE);
    return list?.isNotEmpty == true;
  }
}

class PrefConstants {
  static const String IS_LOGGED = "isLogged";
  static const String AUTH_MODEL = "authModel";
  static const String IS_REMEMBER_ME = "isRememberMe";
  static const String IS_BIOMETRIC_ENABLED = "isBiometricEnabled";
  static const String PASSWORD = "password";
  static const String COMPANY_CODE = "companyCode";
  static const String FCM_TOKEN = "fcm_token";
  static const String SELECTED_COMPANY_CODE = "selectedCompanyCode";
  static const String COMPANY_CODE_MODEL = "companyCodeModel";
}
