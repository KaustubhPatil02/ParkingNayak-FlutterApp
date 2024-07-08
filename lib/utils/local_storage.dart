import '../utils/shared_prefs.dart';

class LocalStorage {
  static Future<void> isAuth(bool isAuth) async {
    await prefs()!.setBool('isAuth', isAuth);
  }

  static Future<void> isIntro(bool isIntro) async {
    await prefs()!.setBool('isIntro', isIntro);
  }

  static bool? getAuth() {
    return prefs()!.getBool('isAuth');
  }

  static bool? getIntro() {
    return prefs()!.getBool('isIntro');
  }

  static Future<void> setNumberPlate(String numberPlate) async {
    await prefs()!.setString('numberPlate', numberPlate);
  }

  static String getNumberPlate() {
    return prefs()!.getString('numberPlate') ?? "";
  }

  // static Future<void> saveProfile(String currentUser) async {
  //   await prefs()!.setString('currentProfile', currentUser);
  // }

  // static String getUser() {
  //   return prefs()!.getString('currentUser') ?? "";
  // }

  // static String getProfile() {
  //   return prefs()!.getString('currentProfile') ?? "";
  // }

  // static Future<bool> removeUser() {
  //   return prefs()!.remove('currentUser');
  // }

  // static Future<bool> removeProfile() {
  //   return prefs()!.remove('currentProfile');
  // }

  // static Future<void> clearUser() {
  //   return prefs()!.clear();
  // }

}
