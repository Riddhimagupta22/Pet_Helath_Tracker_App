import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Models/User_model.dart';

class UserService {
  Future<void> saveUserProfile(UserModel User) async {
    final user = FirebaseAuth.instance.currentUser!;
    await Supabase.instance.client
        .from('Users')
        .upsert({'uid': user.uid, ...User.toMap()});
  }

  Future<UserModel?> getUserProfile() async {
    final user = FirebaseAuth.instance.currentUser!;
    final response = await Supabase.instance.client
        .from('Users')
        .select()
        .eq('uid', user.uid)
        .single();

    if (response != null) {
      return UserModel.fromMap(response);
    }
    return null;
  }

  Future<String> uploadUserImage(File file) async {
    final user = FirebaseAuth.instance.currentUser!;
    final fileName = 'Users/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    await Supabase.instance.client.storage
        .from('User_images')
        .upload(fileName, file);

    final url = Supabase.instance.client.storage
        .from('User_images')
        .getPublicUrl(fileName);

    return url;
  }
}
