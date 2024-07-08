import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:parking_nayak/config/colors_manager.dart';
import 'package:parking_nayak/domain/provider/provider.dart';
import 'package:parking_nayak/presentation/pages/home/home_screen.dart';
import 'package:parking_nayak/presentation/widgets/add_dialog.dart';
import 'package:parking_nayak/presentation/widgets/custom_button.dart';
import 'package:parking_nayak/utils/local_storage.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:intl/intl.dart';
import 'dart:math';

// Your code here

class ReceiptScreen extends ConsumerStatefulWidget {
  const ReceiptScreen({super.key, required this.filePath});

  final filePath;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends ConsumerState<ReceiptScreen> {
  bool _isBusy = false;

  TextEditingController controller = TextEditingController();
  final vehicleNumberController = TextEditingController();

  String locationMessage = "Current location of user";
  late String lat;
  late String long;

  Future<Position> _getcurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location services are disabled");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final InputImage image = InputImage.fromFilePath(widget.filePath);

    processImage(image, ref);
  }

  @override
  Widget build(BuildContext context) {
    // final numberPlate = LocalStorage.getNumberPlate();
    final numberPl = ref.watch(numberPlate);
    DateTime currenttime = DateTime.now();
    String checkDate = DateFormat("dd/MM/yy").format(currenttime);
    String formattedTime = DateFormat('hh:mm a').format(currenttime);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ticket",
          style: TextStyle(
            color: ColorManager.fontPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text("This is scanned text :"),
          // Center(
          //   child: _isBusy
          //       ? const CircularProgressIndicator()
          //       :
          //       Text(
          //           controller.text,
          //         ),
          // ),
          // Container(
          //   height: 30,
          //   width: 160,
          //   child: TextField(
          //     cursorColor: Colors.black54,
          //     textAlign: TextAlign.center,
          //     textInputAction: TextInputAction.go,
          //     onChanged: (value) {
          //       vehicleNumberController.value = TextEditingValue(
          //           text: value.toUpperCase(),
          //           selection: vehicleNumberController.selection);
          //     },
          //     textCapitalization: TextCapitalization.characters,
          //     controller: vehicleNumberController,
          //     decoration: InputDecoration(
          //       // border: Border(bottom: 1),s
          //       focusedBorder: UnderlineInputBorder(
          //           borderSide: BorderSide(width: 0.5, color: Colors.black)),
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(
          //             width: 0.5, color: Colors.black), //<-- SEE HERE
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //     ),
          //   ),
          // ),
          // CustomButton(text: "Send data", onPressed: () {
          // })
          Text(
            "Ticket Raised",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          // Lottie.asset("assets/splash_sparkle.json"),
          Center(
              child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: ColorManager.secondaryColor,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Officer :",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Kirakami",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "NumberPlate :",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        numberPl,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Date :",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        checkDate,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Time :",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        formattedTime,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Fine :",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "400Rs",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: "Edit",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddDialog(),
                      );
                    },
                    width: 200,
                    primaryColor: ColorManager.secondaryColor,
                    secondaryColor: ColorManager.primaryColor,
                  )
                ]),
          )),
          SizedBox(
            height: 20,
          ),
    Container(
  height: 160,
  width: 360,
  child: SlideAction(
    sliderRotate: true,
    text: "Confirm ticket",
    textStyle: TextStyle(fontSize: 16, color: ColorManager.primaryColor),
    innerColor: ColorManager.primaryColor,
    outerColor: ColorManager.secondaryColor,
    borderRadius: 24,
    sliderButtonIcon: Icon(
      IconlyLight.ticket,
    ),
    onSubmit: () async {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      // Array of location URLs
      List<String> locations = [
        "https://maps.app.goo.gl/Pc5V8fJQU6Us1LTL6",
        "https://www.google.com/maps/dir//National+Highway+No+8,+vasaifata+,Nr+HP+petrol+pump.,+Vasai+East,+Vasai-Virar,+Maharashtra+401208/@19.4294614,72.7893706,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3be7a8c1cf5cecc9:0x14067bc3d5347e9c!2m2!1d72.8717738!2d19.4294704?hl=en&entry=ttu",
        "https://maps.app.goo.gl/https://www.google.com/maps/place/Suncity,+Vasai+-+Events+Ground/@19.3845789,72.8162143,17z/data=!4m14!1m7!3m6!1s0x3be7aebb6e0c32bd:0x4dceeb957f1fc31c!2sSuncity,+Vasai+-+Events+Ground!8m2!3d19.3841943!4d72.8198728!16s%2Fg%2F1hhxhl3cr!3m5!1s0x3be7aebb6e0c32bd:0x4dceeb957f1fc31c!8m2!3d19.3841943!4d72.8198728!16s%2Fg%2F1hhxhl3cr?entry=ttu",
        // Add more locations as needed
      ];
      //extra array for number plate not in use 
      List<String> registered_numberPlate =[
        "KA05JX2509",
        "MH48CF1788",
        "MH48CG1704",

      ];

      // Select a random location from the array
      var random = new Random();
      var dropLocation = locations[random.nextInt(locations.length)];
      var numberPlate = registered_numberPlate[random.nextInt(registered_numberPlate.length)];

      ref.read(
        createParkingTicketProvider(
          numberPlate: numberPl,
          phoneNo: "+919834388054",
          dateTime: DateTime.now(),
          officerId: userId,
          // numberPlate: numberPlate,
          dropLocation: dropLocation,
          fine: 700,
        ),
      );
    },
  ),
),
                final snackBar = SnackBar(backgroundColor: ColorManager.alertColor,
                        content: const Text('SMS sent to owner!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
                // pickImage(context);
              },
            ),
                );,
              ],;
            ),
          );
  }

  // void liveLocation() {
  //   LocationSettings locationSettings = const LocationSettings(
  //     accuracy: LocationAccuracy.high,
  //     distanceFilter: 100,
  //   );
  //   Geolocator.getPositionStream(locationSettings: locationSettings)
  //       .listen((Position position) {
  //     lat = position.latitude.toString();
  //     long = position.longitude.toString();
  //   });
  //   setState(() {
  //     locationMessage = "Latitude : $lat Longitude : $long";
  //   });
  // }

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

  void processImage(InputImage image, WidgetRef ref) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      _isBusy = true;
    });

    // console.log(image.filePath!);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    controller.text = recognizedText.text;
    ref.read(numberPlate.notifier).state = recognizedText.text;
    LocalStorage.setNumberPlate(controller.text);

    ///End busy state
    setState(() {
      _isBusy = false;
    });
  }
}
