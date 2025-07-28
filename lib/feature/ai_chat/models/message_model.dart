import 'package:uuid/uuid.dart';

import '../../../core/utils/enums.dart';

const _uuid = Uuid();
class Message {
  final String id;
  final String content;
  final DateTime timestamp;
  final MessageState state;
  final MessageRole role;

  Message({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.state,
    required this.role,
  });

  Message copyWith({
    String? id,
    String? content,
    DateTime? timestamp,
    MessageState? state,
    MessageRole? role,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      state: state ?? this.state,
      role: role ?? this.role,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      state: MessageState.values.firstWhere((e) => e.toString() == 'MessageState.${json['state']}'),
      role: MessageRole.values.firstWhere((e) => e.toString() == 'MessageRole.${json['role']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'state': state.toString().split('.').last,
      'role': role.toString().split('.').last,
    };
  }

  @override
  String toString() {
    return 'Message(id: $id, content: $content, timestamp: $timestamp)';
  }

  factory Message.addUserMessage(String content) {
    return Message(
      id: _uuid.v4(),
      content: content,
      timestamp: DateTime.now().toUtc(),
      role: MessageRole.user,
      state: MessageState.complete,
    );
  }

  factory Message.addLlmMessage(String content, MessageState state) {
    return Message(
      id: _uuid.v4(),
      content: content,
      timestamp: DateTime.now().toUtc(),
      state: state,
      role: MessageRole.llm,
    );
  }

  Message updateMessage({
    required String addContent,
    required MessageState state,
  }) {
    return copyWith(
      content: content + addContent,
      state: state,
      timestamp: DateTime.now().toUtc(),
    );
  }
}
