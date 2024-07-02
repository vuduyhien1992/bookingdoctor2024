
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile/screens/account/account_screen.dart';
import '../screens/appointment/appointment_screen.dart';
import '../screens/blog/blog_screen.dart';
import '../screens/doctor/doctor_screen.dart';
import '../screens/home/home_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../utils/store_current_user.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationControllerForDoctor());
    final currentUser = CurrentUser.to.user;
    return Scaffold(
      bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.onDestinationSelected(index, context),
            destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(icon: FaIcon(FontAwesomeIcons.userDoctor), label: 'Doctor'),
                  NavigationDestination(icon: Icon(Icons.calendar_month), label: 'Appointment'),
                  NavigationDestination(icon: Icon(Icons.feed), label: 'Blog'),
                  NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
              ],
          ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationControllerForDoctor extends GetxController {
  final currentUser = CurrentUser.to.user;
  final Rx<int> selectedIndex = 0.obs;
  final RxBool loggedIn = false.obs;
  final screens = [
    const HomeScreen(),
    const DoctorScreen(),
    const AppointmentScreen(),
    const BlogScreen(),
    const AccountScreen(),
  ];

  void onDestinationSelected(int index, BuildContext context) {
    if(index == 2 && currentUser.isEmpty) {
      AwesomeDialog(
        context: context,
        animType: AnimType.bottomSlide,
        dialogType: DialogType.warning,
        body: Center(child: Text(
          'Please Sign in to use this function',
          style: TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),),
        btnOkOnPress: () {
          Navigator.pushNamed(context, '/sign-in');
        },
      )..show();
    }else if(index == 4 && currentUser.isEmpty){
      AwesomeDialog(
        context: context,
        animType: AnimType.bottomSlide,
        dialogType: DialogType.warning,
        body: Center(child: Text(
          'Please Sign in to use this function',
          style: TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),),
        btnOkOnPress: () {
          Navigator.pushNamed(context, '/sign-in');
        },
      )..show();
    }
    selectedIndex.value = index;
  }

  void login() {
    // Perform login logic
    // On successful login, update the loggedIn status
    final controller = Get.find<NavigationControllerForDoctor>();
    controller.loggedIn.value = true;
  }


}
