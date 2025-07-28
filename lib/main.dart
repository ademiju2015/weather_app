import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpt_mini/core/layout/templates/app_layout.dart';
import 'package:gpt_mini/core/services/gemini_services.dart';
import 'package:gpt_mini/core/utils/colors.dart';
import 'package:gpt_mini/feature/ai_chat/screens/layouts/desktop/body.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async{

  runApp(const ProviderScope(child: MainApp(),));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(geminiModelProvider);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
      
        appBarTheme: const AppBarTheme(
          backgroundColor: KColors.body,
        ),
      
      ),
      builder:
          (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 600, name: MOBILE),
              const Breakpoint(start: 601, end: 1199, name: TABLET),
              const Breakpoint(start: 1200, end: double.infinity, name: DESKTOP),
            ],
            
          ),
          home:  model.when(data: (data)=>SiteTemplate(
              useLayout: true,
              desktop: GPTBody(),
             
    ), error: (error, st)=> Scaffold(
      body: Center(child: Text('Error initializing model'),
      ),
    ), loading: ()=> Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )));
  }
}
