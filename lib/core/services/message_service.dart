import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_mini/core/services/gemini_services.dart';
import 'package:gpt_mini/feature/ai_chat/providers/chat_state_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class MessageService {
  MessageService(this.ref);
  final Ref ref;

  Future<void> sendMessage(String message)
 async{

  final chatSession = await ref.read(chatSessionProvider.future);
  final chatStateNotifier =  ref.read(chatStateNotifierProvider.notifier);
  
  chatStateNotifier.addUserMessage(message);

  final llmMessage = chatStateNotifier.createLlmMessage();

  try {
    final response = await chatSession.sendMessage(Content.text(message));
    final responseText = response.text;

    if(responseText != null){
      chatStateNotifier.appendMessage(responseText, llmMessage.id);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  finally{
    chatStateNotifier.finalizeMessage(llmMessage.id);
  }
 }}

 @riverpod
 MessageService messageService (Ref ref) {
  return MessageService(ref);
 }
