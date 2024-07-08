import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_nayak/config/colors_manager.dart';
import 'package:parking_nayak/domain/provider/provider.dart';
import 'package:parking_nayak/presentation/widgets/custom_button.dart';

import '../../widgets/input_box.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final TextEditingController _userEditingController = TextEditingController();
  final TextEditingController _batchEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _locationEditingController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection("officer");
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: user.doc(userUid).get(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              _userEditingController.text = snapshot.data!["name"];
              _batchEditingController.text = snapshot.data!["batch_id"];
              _phoneEditingController.text = snapshot.data!["phone_no"];
              _locationEditingController.text = snapshot.data!["location"];

              return Column(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 50,
                      // child: CircleAvatar(
                      //     radius: 38,
                      //     backgroundImage: IconlyLight.user3),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputText(
                          textEditingController: _userEditingController,
                          icon: IconlyLight.addUser,
                          title: "Officer",
                          widthMain: 320,
                          width: 400,
                          onPressed: () {},
                          hintText: "",
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputText(
                          textEditingController: _batchEditingController,
                          icon: IconlyLight.paperNegative,
                          title: "Batch number",
                          widthMain: 320,
                          width: 400,
                          onPressed: () {},
                          hintText: "",
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputText(
                          textEditingController: _phoneEditingController,
                          icon: IconlyLight.callMissed,
                          title: "Phone number",
                          numberOnly: true,
                          widthMain: 320,
                          width: 400,
                          onPressed: () {},
                          hintText: "",
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputText(
                          textEditingController: _locationEditingController,
                          icon: IconlyLight.location,
                          title: "Location",
                          widthMain: 320,
                          width: 400,
                          onPressed: () {},
                          hintText: "",
                        ),
                      ]),
                  Spacer(
                    flex: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: "Cancel",
                        onPressed: () {
                          ref.read(officerName.notifier).state =
                              _userEditingController.text;
                          Navigator.of(context).pop();
                        },
                        width: 150,
                        primaryColor: ColorManager.secondaryColor,
                        secondaryColor: ColorManager.primaryColor,
                      ),
                      CustomButton(
                          text: "Update",
                          onPressed: () {
                            ref.read(officerName.notifier).state =
                                _userEditingController.text;
                            ref.read(
                              updateOfficerProvider(
                                batchId: _batchEditingController.text,
                                userId: currentUser!.uid,
                                officerName: _userEditingController.text,
                                phoneNo: _phoneEditingController.text,
                                location: _locationEditingController.text,
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                          width: 150,
                          primaryColor: ColorManager.primaryColor,
                          secondaryColor: ColorManager.secondaryColor)
                    ],
                  ),
                  Spacer(
                    flex: 4,
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                strokeWidth: 1,
              ));
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}
