import 'package:cat_gpt/app/features/chat/model/bot_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'chat_repository.g.dart';

// Insert uri
@RestApi()
abstract class ChatRepository {
  factory ChatRepository(Dio dio, {String baseUrl}) = _ChatRepository;

  @POST('/chat/completions')
  Future<BotResponseModel> getChatResponse(
    @Body() Map<String, dynamic> body,
  );
}
