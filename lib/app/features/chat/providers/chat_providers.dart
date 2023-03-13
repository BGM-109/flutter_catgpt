import 'package:cat_gpt/app/core/network/dio_provider.dart';
import 'package:cat_gpt/app/features/cats/cats_providers.dart';
import 'package:cat_gpt/app/features/chat/model/chat_model.dart';
import 'package:cat_gpt/app/features/chat/model/message_model.dart';
import 'package:cat_gpt/app/features/chat/repository/chat_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_providers.g.dart';

@Riverpod(keepAlive: true)
ChatRepository chatRepository(ChatRepositoryRef ref) {
  final dio = ref.read(gptDioProvider);

  return ChatRepository(dio);
}

final getChatListProvider = StateProvider<ChatModel>((ref) {
  final cats = ref.watch(catsProvider);

  final List<String> rules = [
    '단어의 끝에 냥을 붙여줘',
    '문장의 끝에 냥을 붙여줘',
    '마침표가 나오면 냥을 붙여줘',
    '다로 끝나는 문장은 냥으로 변경해줘',
    '요로 끝나는 문장은 냥으로 변경해줘',
    '${cats.description} 라는 성격을 부여해줘',
    '말투도 성격에 맞게 바꿔줘'
  ];

  final List<MessageModel> systemMsg = [
    MessageModel(rules.join(','), Role.system),
  ];
  final MessageModel greetingMsg =
      MessageModel('안녕, 나는 ${cats.name}다냥. 무엇을 도와줄까냥?', Role.assistant);
  return ChatModel([
    ...systemMsg,
    greetingMsg,
  ]);
});
