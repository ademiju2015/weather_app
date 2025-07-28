import 'package:gpt_mini/core/utils/enums.dart';
import 'package:gpt_mini/feature/ai_chat/models/chat_model.dart';
import 'package:gpt_mini/feature/ai_chat/models/message_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_state_notifier.g.dart';

@riverpod
class ChatStateNotifier extends _$ChatStateNotifier {
  @override
  ChatState build()=> ChatState.initial();

  Message addUserMessage(String content) {
    state = state.addUserMessage(content);
    return state.message.last;
  }

  Message addLlmMessage(String content, MessageState msgState){
      state =  state.addLlmMessage( msgState, content);
      return state.message.last;
  
  }

  Message createLlmMessage() => addLlmMessage('', MessageState.streaming);

  void appendMessage(String id, String addContent){
    state = state.appendMessage(id, addContent);
  }

  void finalizeMessage(String id){
    state = state.finalizeMessage(id);
  }

  void reset(){
    state = ChatState.initial();
  }
}