import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_nayak/config/colors_manager.dart';
import 'package:parking_nayak/domain/provider/provider.dart';
import 'package:parking_nayak/presentation/pages/auth/auth_screen.dart';
import 'package:parking_nayak/utils/local_storage.dart';

import '../pages/home/home_screen.dart';
import '../pages/profile/profile_screen.dart';

class NavDrawer extends ConsumerStatefulWidget {
  const NavDrawer({super.key});

  @override
  ConsumerState<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends ConsumerState<NavDrawer> {
  bool _isLogin = false;
  @override
  Widget build(BuildContext context) {
    final isAuth = LocalStorage.getAuth();
    if (isAuth == true) {
      setState(() {
        _isLogin = true;
      });
    } else {
      setState(() {
        _isLogin = false;
      });
    }

    return Drawer(
            backgroundColor: Colors.white,
            elevation: 2,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 80,
                ),
                // DrawerHeader(
                //   // decoration: BoxDecoration(
                //   //   color: Colors.blue,
                //   // ),
                //   child: Icon(IconlyLight.user2)
                // ),
                const Text(
                  // _isLogin ? "Parking" : "VehiScan",
                  "ParkNayak",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                // Divider(),
                ListTile(
                  trailing: Icon(IconlyBold.profile),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),

                ListTile(
                  trailing: Icon(
                    IconlyBold.logout,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  onTap: () {
                    logoutUser(ref);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PhoneAuthPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }

  Future<void> logoutUser(WidgetRef ref) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Row(
            children: [
              Icon(
                IconlyBold.danger,
                color: ColorManager.alertColor,
              ),
              SizedBox(
                width: 5,
              ),
              
              Text(
                "Sign Out",
                style: TextStyle(color: ColorManager.alertColor),
              ),
            ],
          ),
          content: Text(
            "Are you sure you want to Logout?",
            style: TextStyle(color: ColorManager.fontPrimary),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                // This is very important do not change order of below code it caused gms.google.com not connected issue.
                await Future.delayed(const Duration(seconds: 1));

                if (!mounted) return;
                

                ref.read(isAuth.notifier).state = false;
                await FirebaseAuth.instance.signOut();
                LocalStorage.isAuth(false);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PhoneAuthPage()));

                // make API call to logout
              },
              child:
                  Text("Ok", style: TextStyle(color: ColorManager.fontPrimary)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text("Cancel",
                  style: TextStyle(color: ColorManager.fontSecondry)),
            ),
          ],
        );
      },
    );
  }
}
