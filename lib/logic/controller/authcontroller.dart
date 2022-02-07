import 'package:elhanout/model/facebookmodel.dart';
import 'package:elhanout/routes/routes.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool passShow = true.obs;
  RxBool isChecked = false.obs;
  Rx<IconData> suffixIcon = Icons.visibility.obs;
  var displayUserName = '';
  var displayUserImg = '';
  var auth = FirebaseAuth.instance;
  FacebookModel? facebookModel;

  void changeCheckBox() {
    isChecked.value = !isChecked.value;
  }

  void visibility() {
    passShow.value = !passShow.value;
    suffixIcon.value =
        passShow.isTrue ? Icons.visibility : Icons.visibility_off;
  }

  void signUpUsingEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
        Get.offNamed(AppRoutes.layoutScreen);
      });
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      Get.snackbar(
        title,
        e.message ?? '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: darkGreyClr.withOpacity(0.8),
        colorText: Colors.white,
        borderColor: Get.isDarkMode ? pinkClr : mainColor,
        borderWidth: 2.0,
      );
    } catch (e) {
      Get.snackbar(
        'Error!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: darkGreyClr.withOpacity(0.8),
        colorText: Colors.white,
        borderColor: Get.isDarkMode ? pinkClr : mainColor,
        borderWidth: 2.0,
      );
    }
  }

  void loginUsingEmail({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.offNamed(AppRoutes.layoutScreen);
      });
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      Get.snackbar(
        title,
        e.message ?? '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: darkGreyClr.withOpacity(0.8),
        colorText: Colors.white,
        borderColor: Get.isDarkMode ? pinkClr : mainColor,
        borderWidth: 1.0,
      );
    } catch (e) {
      Get.snackbar(
        'Error!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: darkGreyClr.withOpacity(0.8),
        colorText: Colors.white,
        borderColor: Get.isDarkMode ? pinkClr : mainColor,
        borderWidth: 1.0,
      );
    }
  }

  void resetPassword({
    required String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) {
        Get.back();
        Get.snackbar(
          'Success',
          'Reset Email sent successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: darkGreyClr.withOpacity(0.8),
          colorText: Colors.white,
          borderColor: Get.isDarkMode ? pinkClr : mainColor,
          borderWidth: 1.0,
        );
      });
      update();

    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      Get.snackbar(
        title,
        e.message ?? '',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: darkGreyClr.withOpacity(0.8),
        colorText: Colors.white,
        borderColor: Get.isDarkMode ? pinkClr : mainColor,
        borderWidth: 1.0,
      );
    } catch (e) {
      Get.snackbar(
        'Error!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: darkGreyClr.withOpacity(0.8),
        colorText: Colors.white,
        borderColor: Get.isDarkMode ? pinkClr : mainColor,
        borderWidth: 1.0,
      );
    }
  }

  void googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      displayUserName = googleUser!.displayName!;
      displayUserImg = googleUser.photoUrl!;
      update();
      Get.offNamed(AppRoutes.layoutScreen);
    } catch (e) {
      Get.snackbar(
        'Error!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: darkGreyClr.withOpacity(0.8),
        colorText: Colors.white,
        borderColor: Get.isDarkMode ? pinkClr : mainColor,
        borderWidth: 1.0,
      );
    }
  }

  void faceBookSignIn() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      facebookModel = FacebookModel.fromJson(userData);
      print(facebookModel!.email);
      print(facebookModel!.name);
      print(facebookModel!.picture!.url);
      print(facebookModel!.id);
      update();
      Get.offNamed(AppRoutes.layoutScreen);
    } else {
      Get.snackbar(
        'Error!',
        'Login Failed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: darkGreyClr.withOpacity(0.8),
        colorText: Colors.white,
        borderColor: Get.isDarkMode ? pinkClr : mainColor,
        borderWidth: 1.0,
      );
    }
  }
  
}
