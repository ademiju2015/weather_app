import 'package:gpt_mini/feature/ai_chat/models/message_model.dart';

import '../../../core/utils/enums.dart';

class ChatState {
  final String id;
  final List<Message> message;
  final DateTime timestamp;

  ChatState({
    required this.id,
    required this.message,
    required this.timestamp,
  });

  factory ChatState.initial() {
    return ChatState(
      id: '',
      message: [],
      timestamp: DateTime.now(),
    );
  }

  ChatState copyWith({
    String? id,
    List<Message>? message,
    DateTime? timestamp,
  }) {
    return ChatState(
      id: id ?? this.id,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message.map((msg) => msg.toJson()).toList(),
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory ChatState.fromJson(Map<String, dynamic> json) {
    return ChatState(
      id: json['id'] as String,
      message: (json['message'] as List)
          .map((msg) => Message.fromJson(msg as Map<String, dynamic>))
          .toList(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  // ChatState createLlmMessage

  ChatState addLlmMessage(MessageState state, String content) {
    return copyWith(
      message: [
        ...message,
        Message.addLlmMessage(content, state)
      ],
    );
  }

  ChatState addUserMessage(String content) {
    return copyWith(
      message: [
        ...message,
        Message.addUserMessage(content)
      ],
    );
  }

  ChatState appendMessage(String content, String id) {
    final splitIndex = message.indexWhere((msg) => msg.id == id);
    if (splitIndex == -1) {
      return this;
    }
  final before = message.sublist(0, splitIndex);
  final msge = message[splitIndex].copyWith(
      id: id,
      content: message[splitIndex].content + content,
    );
      
  final after = message.sublist(splitIndex + 1);
    return copyWith(
      message: [...before,msge, ...after],
    );
  }

  ChatState finalizeMessage(String id,) {
    final splitIndex = message.indexWhere((msg) => msg.id == id);
    if (splitIndex == -1) {
      return this;
    }
    final before = message.sublist(0, splitIndex);
    final msge = message[splitIndex].copyWith(
      id: id,
      state: MessageState.complete,
      timestamp: DateTime.now().toUtc(),
    );
    final after = message.sublist(splitIndex + 1);
    return copyWith(
      message: [...before, msge, ...after],
    );
  }

  ChatState clearMessages ()=> copyWith(message: []);

}