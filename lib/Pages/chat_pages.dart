// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:perplexity_clone/widget/answer_section.dart';
// import 'package:perplexity_clone/widget/side_bar.dart';
// import 'package:perplexity_clone/widget/sources_section.dart';

// class ChatPage extends StatelessWidget {
//   final String question;
//   const ChatPage({super.key, required this.question});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           kIsWeb ? SideBar() : SizedBox(),
//           kIsWeb ? const SizedBox(width: 100) : SizedBox(),
//           Expanded(
//             child: Scrollbar(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         question,
//                         style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 24),
//                       SourcesSection(),
//                       SizedBox(height: 24),
//                       AnswerSection(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perplexity_clone/widget/answer_section.dart';
import 'package:perplexity_clone/widget/side_bar.dart';
import 'package:perplexity_clone/widget/sources_section.dart';

class ChatPage extends StatelessWidget {
  final String question;
  ChatPage({super.key, required this.question});

  // Create a ScrollController
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? SideBar() : SizedBox(),
          kIsWeb ? const SizedBox(width: 100) : SizedBox(),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true, // Show the scrollbar always (optional)
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      SourcesSection(),
                      SizedBox(height: 24),
                      AnswerSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
