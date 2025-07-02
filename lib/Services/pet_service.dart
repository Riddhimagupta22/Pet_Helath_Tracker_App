import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Models/pet_model.dart';

class PetService {
  Future<void> savePetProfile(PetModel pet) async {
    final user = FirebaseAuth.instance.currentUser!;
    await Supabase.instance.client
        .from('pets')
        .upsert({'uid': user.uid, ...pet.toMap()});
  }

  Future<PetModel?> getPetProfile() async {
    final user = FirebaseAuth.instance.currentUser!;
    final response = await Supabase.instance.client
        .from('pets')
        .select()
        .eq('uid', user.uid)
        .single();

    if (response != null) {
      return PetModel.fromMap(response);
    }
    return null;
  }

  Future<String> uploadPetImage(File file) async {
    final user = FirebaseAuth.instance.currentUser!;
    final fileName = 'pets/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    await Supabase.instance.client.storage
        .from('pet_images') // Your bucket name
        .upload(fileName, file);

    final url = Supabase.instance.client.storage
        .from('pet_images')
        .getPublicUrl(fileName);

    return url;
  }
}
