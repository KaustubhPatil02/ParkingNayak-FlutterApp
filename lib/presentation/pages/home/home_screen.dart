import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:parking_nayak/config/colors_manager.dart';
import 'package:parking_nayak/domain/models/parking_ticket.dart';
import 'package:parking_nayak/domain/provider/provider.dart';
import 'package:parking_nayak/presentation/pages/receipt_screen/receipt_screen.dart';
import 'package:parking_nayak/presentation/pages/scan/scanner_screen.dart';
import 'package:parking_nayak/presentation/widgets/custom_button.dart';
import 'package:parking_nayak/presentation/widgets/drawer.dart';
import 'package:parking_nayak/utils/image_picker.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final officer = ref.watch(officerName);
    return Scaffold(
        endDrawer: const NavDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 110,
          leadingWidth: 200,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Officer",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    officer,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   "./assets/Hello.svg",
                //   height: 18,
                // ),
                Stack(
                  children: [
                    Lottie.asset("assets/police_office.json"),
                    // Lottie.asset(""),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Ready to catch no parkers?"),
                SizedBox(
                  height: 20,
                ),
                // CustomButton(
                //   primaryColor: ColorManager.secondaryColor,
                //     secondaryColor: ColorManager.primaryColor,
                //   width: 300,
                //     text: "Create officer",
                //     onPressed: () {
                //       FirebaseProvider().createOfficer(
                //           userId: "idc",
                //           batchId: "131",
                //           officerName: "Akshat",
                //           phoneNo: "+918378996992",
                //           location: "Virar(e)");
                //       // ref.read(createOfficerProvider(
                //       //         userId: "sda",
                //       //         batchId: "1231",
                //       //         officerName: "Kaustubh",
                //       //         phoneNo: 8378996992,
                //       //         location: "Virar(w)")
                //       //     .future);
                //     }),
                // CustomButton(
                //   primaryColor: ColorManager.secondaryColor,
                //     secondaryColor: ColorManager.primaryColor,
                //   width: 300,
                //     text: "Update officer",
                //     onPressed: () {
                //       ref.read(updateOfficerProvider(
                //           // id: id,
                //           userId: "sda",
                //           batchId: "1432",
                //           officerName: "Kaustubh",
                //           phoneNo: 8378996992,
                //           location: "Virar(w)"));
                //     }),
                // CustomButton(
                //   width: 300,
                //     text: "Create Parking ticket",
                //     primaryColor: ColorManager.secondaryColor,
                //     secondaryColor: ColorManager.primaryColor,
                //     onPressed: () {

                //     }),
              ],
            ),
          ),
          Container(
            alignment: Alignment(0, 0.7),
            child: CustomButton(
              primaryColor: ColorManager.primaryColor,
              secondaryColor: ColorManager.secondaryColor,
              width: 300,
              text: "Scan",
              onPressed: () {
                pickImage(context);
              },
            ),
          )
        ]));
  }

  void pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final navigator = Navigator.of(context);
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      print(pickedImage.path);
      await navigator.push(
        MaterialPageRoute(
          builder: (context) => ReceiptScreen(
            filePath: pickedImage.path,
          ),
        ),
      );
    }
  }
}
