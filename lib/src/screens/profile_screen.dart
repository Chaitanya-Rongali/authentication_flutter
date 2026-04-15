import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? email;
  String? username;
  bool isLoading = true;
  File? profileImage;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      email = prefs.getString('email');
      username = prefs.getString('username');
      isLoading = false;
    });
  }

  Future<void> pickProfileImage(ImageSource source) async {
    final PermissionStatus status;
    if (source == ImageSource.camera) {
      status = await Permission.camera.request();
    }else {
      status = await Permission.photos.request();
    }
    if (status.isPermanentlyDenied) {
      openAppSettings();
      return;
    }
    if (!status.isGranted) {
    return; 
  }
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: source);
      if (picked != null) {
        setState(() => profileImage = File(picked.path));
      }
    
  }

  void showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Profile Picture'),
          content: const Text('Choose where to get your profile picture from:'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                pickProfileImage(ImageSource.camera);
              },
              child: const Text('Camera'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                pickProfileImage(ImageSource.gallery);
              },
              child: const Text('Gallery'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final displayEmail = email ?? 'Not available';
    final displayUsername = username ?? 'Not available';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: showImagePickerDialog,
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.blue, width: 2),
                    image: profileImage != null
                        ? DecorationImage(
                            image: FileImage(profileImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: profileImage == null
                      ? const Icon(Icons.person, size: 60, color: Colors.grey)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Username: $displayUsername'),
          const SizedBox(height: 20),
          Text('Email: $displayEmail'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              // ignore: use_build_context_synchronously
              context.go('/');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
