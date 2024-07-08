import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  final vehicleNumberController = TextEditingController();
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;
  bool is_typing = false;

  @override
  void initState() {
    startCamera(direction);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("Officer"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: 300,
              child: CameraPreview(cameraController),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Number plate"),
            Text("show text"),
            Container(
              height: 30,
              width: 160,
              child: TextField(
                cursorColor: Colors.black54,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.go,
                onChanged: (value) {
                  setState(() {
                    is_typing = true;
                  });
                  vehicleNumberController.value = TextEditingValue(
                      text: value.toUpperCase(),
                      selection: vehicleNumberController.selection);
                },
                textCapitalization: TextCapitalization.characters,
                controller: vehicleNumberController,
                decoration: InputDecoration(
                  // border: Border(bottom: 1),s
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.5, color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.5, color: Colors.black), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                cameraController.takePicture().then((XFile? file) {
                  if (mounted) {
                    if (file != null) {
                      print("Picture saved to ${file.path}");
                    }
                  }
                });
              },
              child:
                  button(Icons.camera_alt_outlined, Alignment.bottomCenter),
            )
          ],
        ),
      ));
    } else {
      return SizedBox();
    }
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
