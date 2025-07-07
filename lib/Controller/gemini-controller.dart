import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../Comman/Utils/prompt.dart';

class GeminiController extends GetxController {
  final model = GenerativeModel(model: 'gemini-pro', apiKey: '');
  RxString selectedCategory = 'Health'.obs;
  RxString Response = ''.obs;
  RxBool isLoading = false.obs;

  Future getGeminiResponse(String question) async {
    if (question.isEmpty) return;
    isLoading.value = true;

    final prompt = getPrompt(selectedCategory.value, question);
    final response = await model.generateContent([Content.text(prompt)]);
    Response.value = response.text ?? 'No respone';

    isLoading.value = false;
  }
}
