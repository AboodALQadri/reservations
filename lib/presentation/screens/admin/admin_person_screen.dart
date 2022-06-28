import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservation/constants/my_colors.dart';
import 'package:reservation/constants/my_routes.dart';
import 'package:reservation/presentation/widgets/person/person_elevated_widget.dart';
import 'package:reservation/presentation/widgets/person/person_text_field_widget.dart';

class AdminPersonScreen extends StatefulWidget {
  const AdminPersonScreen({Key? key}) : super(key: key);

  @override
  State<AdminPersonScreen> createState() => _AdminPersonScreenState();
}

class _AdminPersonScreenState extends State<AdminPersonScreen> {
  final TextEditingController _nameTextController = TextEditingController();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _phoneTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _settingsTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('supervisors').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // String image = (snapshot.data['image']);
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (context, index) {
                DocumentSnapshot myData = snapshot.data!.docs[index];

                return Stack(
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MyColors.kGreenColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 110, top: 30),
                      width: 180,
                      height: 180,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: CircleAvatar(
                        radius: 200,
                        backgroundImage: NetworkImage(myData['image']),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 155, right: 108),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CircleAvatar(
                        backgroundColor: MyColors.kWhiteColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 215,
                        ),
                        Container(
                          width: double.infinity,
                          height: 374,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.1,
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                personTextFieldWidget(
                                  controller: _nameTextController,
                                  readOnly: true,
                                  validator: () {},
                                  textInputType: TextInputType.text,
                                  hintText: myData['name'],
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  ),
                                ),
                                personTextFieldWidget(
                                  controller: _emailTextController,
                                  readOnly: true,
                                  validator: () {},
                                  textInputType: TextInputType.emailAddress,
                                  hintText: myData['email'],
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  ),
                                ),
                                personTextFieldWidget(
                                  controller: _phoneTextController,
                                  readOnly: true,
                                  maxLength: 10,
                                  validator: () {},
                                  textInputType: TextInputType.number,
                                  hintText: myData['phone'].toString(),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  ),
                                ),
                                personTextFieldWidget(
                                  controller: _passwordTextController,
                                  readOnly: true,
                                  validator: () {},
                                  textInputType: TextInputType.text,
                                  hintText: 'كلمة المرور',
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit),
                                  ),
                                ),
                                personTextFieldWidget(
                                  controller: _settingsTextController,
                                  readOnly: true,
                                  validator: () {},
                                  hintText: 'الإعدادات',
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_back_ios_new),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                personElevatedWidget(
                                  text: 'تسجيل خروج',
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, welcomeScreen);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
