
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


const String _baseurl = "http://192.168.100.234:4000/api";
class RestApi {




  Future<http.Response> login(String email, String password) async {
    try {
      final responce = await http
          .post(Uri.parse('$_baseurl/auth/pharmacy/login'),
              headers: <String, String>{'Content-type': 'application/json'},
              body: jsonEncode(
                  <String, String>{'email': email, 'password': password}))
          .timeout(const Duration(seconds: 30), onTimeout: (() {
        return http.Response(jsonDecode("Time out"), 500);
      }));
      return responce;
    } on SocketException {
      return http.Response("Impossible de connecter au serveur !", 500);
    } on TimeoutException {
      return http.Response("Impossible de connecter au serveur !", 500);
    } catch (e) {
      return http.Response("Internal server error !", 500);
    }
  }
  Future<http.Response> postRestPassword(String email) async {
    try {
      final responce = await http
          .post(Uri.parse('$_baseurl/pharmacy/reset-password'),
              headers: <String, String>{
                'Content-type': 'application/json',
              },
              body: jsonEncode(<String, dynamic>{
                'email': email,
              }))
          .timeout(const Duration(seconds: 30), onTimeout: (() {
        return http.Response(jsonDecode("Time out"), 500);
      }));
      return responce;
    } on SocketException {
      return http.Response("Impossible de connecter au serveur !", 500);
    } on TimeoutException {
      return http.Response("Impossible de connecter au serveur !", 500);
    } catch (e) {
      return http.Response("Internal server error !", 500);
    }
  }
    Future<http.Response> postNewPassword(
      String password, String accessToken) async {
    try {
      final responce = await http.post(
          Uri.parse('$_baseurl/pharmacy/new_password'),
          headers: <String, String>{
            'Content-type': 'application/json',
            'Authorization': 'Bearer $accessToken'
          },
          body: jsonEncode(<String, dynamic>{'password': password}));

      return responce;
    } on SocketException {
      return http.Response("Impossible de connecter au serveur !", 500);
    } on TimeoutException {
      return http.Response("Impossible de connecter au serveur !", 500);
    } catch (e) {
      return http.Response("Internal server error !", 500);
    }
  }
  Future<http.Response> postOtp(String otp) async {
    try {
      final responce = await http.post(
          Uri.parse('$_baseurl/pharmacy/reset-password/otp_verify'),
          headers: <String, String>{
            'Content-type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{'otp': otp}));
      return responce;
    } on SocketException {
      return http.Response("Impossible de connecter au serveur !", 500);
    } on TimeoutException {
      return http.Response("Impossible de connecter au serveur !", 500);
    } catch (e) {
      return http.Response("Internal server error !", 500);
    }
  }
}