import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gemini_services.g.dart';

@riverpod
Future<FirebaseApp> firebaseApp(Ref ref)=> Firebase.initializeApp();

@riverpod
Future<GenerativeModel> geminiModel(Ref ref) async{
  await ref.watch(firebaseAppProvider.future);

  final model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-pro');
  debugPrint('Gemini Model Initialized: ${model.toString()}');
  return model;
}

@Riverpod(keepAlive: true)
Future<ChatSession> chatSession(Ref ref)async{
  final model = await ref.watch(geminiModelProvider.future);
  return model.startChat();
}