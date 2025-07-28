import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:gpt_mini/core/utils/colors.dart';

class GPTBody extends ConsumerStatefulWidget {
  const GPTBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GPTBodyState();
}

class _GPTBodyState extends ConsumerState<GPTBody> {

  final chatTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('What are you working on?', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w300, letterSpacing: 1.7)),
        const SizedBox(height: 20),
        Container(
          width: 640,
          height: 130,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color:KColors.containerColor,
            borderRadius: BorderRadius.circular(30),
          ),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    minLines: null,
                    maxLines: null,
                    // expands: true,
                    controller: chatTextController,
                    decoration: InputDecoration(
                      hintText: ' Ask anything...',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Handle send button press
                      },
                      icon: Icon(Icons.add),
                    ),
        
                    Row(
                      children: [
                        IconButton(
                      onPressed: () {
                        // Handle send button press
                      },
                      icon: Icon(Icons.mic_none_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle send button press
                      },
                      icon: Icon(HugeIcons.strokeRoundedAudioWave01),
                    ),
                      ],
                    )
                  ],
                )
              ],
            ),
        )
      ],
    );
  }
}