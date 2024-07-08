import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_nayak/config/colors_manager.dart';
import 'package:parking_nayak/domain/provider/provider.dart';
import 'package:parking_nayak/presentation/pages/receipt_screen/receipt_screen.dart';
import 'package:parking_nayak/utils/local_storage.dart';

class AddDialog extends ConsumerStatefulWidget {
  const AddDialog({super.key});
  // final primaryColor = const Color(0xff4338CA);
  // final accentColor = const Color(0xffffffff);
  // final TextEditingController vehiNum;
  @override
  ConsumerState<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends ConsumerState<AddDialog> {
  TextEditingController vehiNum = TextEditingController();
  // bool isCar = false;
  @override
  Widget build(BuildContext context) {
    final numberPl = ref.watch(numberPlate);
    // final edittingController = TextEditingController();
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 2.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: ColorManager.secondaryColor,
                radius: 25,
                child: Icon(
                  IconlyBold.addUser,
                  size: 36,
                  color: Colors.white,
                )),

            const SizedBox(
              height: 15,
            ),
            Text("Vehicle Number",
                style: TextStyle(
                    color: ColorManager.secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 6,
            ),

            Container(
              width: 160,
              child: TextField(
                controller: vehiNum,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.go,
                onChanged: (value) {
                  vehiNum.value = TextEditingValue(
                      text: value.toUpperCase(), selection: vehiNum.selection);
                },
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ),
            // const Text("This will delete the vehicle details",
            //     style: TextStyle(
            //         color: Colors.grey,
            //         fontSize: 12,
            //         fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 28,
            ),

            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleBtn1(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  invertedColors: true,
                ),
                SimpleBtn1(
                    text: " Update ",
                    onPressed: () {
                      // ref.read(
                      //     addCarsProvider(vehiNum.text.toUpperCase(), isCar));
                      ref.read(numberPlate.notifier).state = vehiNum.text;
                      LocalStorage.setNumberPlate(vehiNum.text);
                      Navigator.of(context).pop();

                      final snackBar = SnackBar(backgroundColor: ColorManager.alertColor,
                        content: const Text('NumberPlate added!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // SnackBar(
                      //   content: Text("New Vehicle added!"),
                      //   backgroundColor: Colors.redAccent,
                      // );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  SimpleBtn1(
      {required this.text,
      required this.onPressed,
      this.invertedColors = false,
      Key? key})
      : super(key: key);
  final primaryColor = ColorManager.secondaryColor;
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
