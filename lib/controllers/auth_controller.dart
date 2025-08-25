import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/controllers/user_controller.dart';
import 'package:kunci_hidup/services/api_service.dart';
import 'package:kunci_hidup/services/shared_prefs_service.dart';
import 'package:kunci_hidup/utils/show_snackbar.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = RxBool(false);
  final api = ApiService();
  // Controller for email input
  final emailController = TextEditingController();

  // Observable for email error message (empty means no error)
  final emailError = ''.obs;

  // Simple email regex pattern for validation
  final RegExp emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  // Validate email, returns true if valid
  bool validateEmail() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      emailError.value = 'Email cannot be empty';
      return false;
    } else if (!emailRegex.hasMatch(email)) {
      emailError.value = 'Please enter a valid email';
      return false;
    }

    emailError.value = '';
    return true;
  }

  Future<String> login(
    String email,
    String password, {
    bool rememberMe = true,
  }) async {
    try {
      final response = await api.post("/api-auth/login/", {
        "email": email.trim(),
        "password": password.trim(),
      });
      var body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.find<UserController>().setInfo(body['data']);
        if (rememberMe) {
          setToken(body['access_token']);
        }

        return "success";
      } else {
        if (body['error'] == "Please verify your email address.") {
          return "verify";
        }

        return body['message'] ?? "Connection Error";
      }
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  Future<String> signup(String name, String email, String password) async {
    try {
      final response = await api.post("/api-auth/signup/", {
        "full_name": name.trim(),
        "email": email.trim(),
        "password": password.trim(),
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return "success";
      } else {
        return jsonDecode(response.body)['message'] ?? "Connection Error";
      }
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  Future<String> sendOtp(String email) async {
    try {
      final response = await api.post("/api-auth/resend_code/", {
        "email": email.trim(),
      });

      if (response.statusCode == 200) {
        return "success";
      } else {
        return jsonDecode(response.body)['message'] ?? "Connection Error";
      }
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  Future<String> verifyEmail(String email, String code) async {
    try {
      final response = await api.post("/api-auth/verify_email/", {
        "email": email.trim(),
        "otp": code.trim(),
      });
      var body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setToken(body['access_token']);
        await Get.find<UserController>().getInfo();

        return "success";
      } else {
        return body['message'] ?? "Connection Error";
      }
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  Future<String> resetPassword(String pass, String conPass) async {
    try {
      final response = await api.post("/api-auth/forgot_password/", {
        "new_password": pass.trim(),
        "confirm_password": conPass.trim(),
      }, authReq: true);
      var body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return "success";
      } else {
        return body['message'] ?? "Connection Error";
      }
    } catch (e) {
      return "Unexpected error: ${e.toString()}";
    }
  }

  Future<bool> previouslyLoggedIn() async {
    String? token = await SharedPrefsService.get('token');
    if (token != null) {
      debugPrint('🔍 Token found. Fetching user info...');
      final message = await Get.find<UserController>().getInfo();
      if (message == "success") {
        debugPrint("🟡 Token: $token");
        isLoggedIn.value = true;
        return true;
      }
    }
    isLoggedIn.value = false;
    return false;
  }

  Future<void> logout() async {
    await SharedPrefsService.clear();
    // Get.offAll(() => Login());
    showSnackBar("You have been logged out");
    isLoggedIn.value = false;
  }

  Future<void> setToken(String value) async {
    await SharedPrefsService.set('token', value);
    debugPrint('💾 Token Saved: $value');
  }
}