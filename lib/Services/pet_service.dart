import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pet_model.dart';

class PetService {
  final _client = Supabase.instance.client;
  final _table = 'pets';

  Future<List<PetModel>> fetchPets(String userId) async {
    final response = await _client
        .from(_table)
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    return (response as List).map((e) => PetModel.fromMap(e)).toList();
  }

  Future<PetModel?> addPet(PetModel pet) async {
    final response = await _client
        .from(_table)
        .insert(pet.toMap())
        .select()
        .single();

    if (response != null) {
      return PetModel.fromMap(response);
    }
    return null;
  }

  Future<void> deletePet(String id) async {
    await _client.from(_table).delete().eq('id', id);
  }

  Future<void> updatePet(String id, Map<String, dynamic> updatedFields) async {
    await _client.from(_table).update(updatedFields).eq('id', id);
  }
}
