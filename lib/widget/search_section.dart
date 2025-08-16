// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:perplexity_clone/Pages/chat_pages.dart';
// import 'package:perplexity_clone/services/chat_web_service.dart';
// import 'package:perplexity_clone/theme/color.dart';
// import 'package:perplexity_clone/widget/search_bar_button.dart';

// class SearchBarSection extends StatefulWidget {
//   const SearchBarSection({super.key});

//   @override
//   State<SearchBarSection> createState() => _SearchBarSectionState();
// }

// class _SearchBarSectionState extends State<SearchBarSection> {
//   final queryController = TextEditingController();
//   final chatService = ChatWebService(); // ✅ create once

//   @override
//   void initState() {
//     super.initState();
//     chatService.connect(); // ✅ connect once
//   }

//   @override
//   void dispose() {
//     queryController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       // ✅ Prevent overflow
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
//           child: Column(
//             children: [
//               Text(
//                 "Where knowledge begins",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.ibmPlexMono(
//                   fontSize: 40,
//                   fontWeight: FontWeight.w500,
//                   height: 1.3,
//                   letterSpacing: -0.5,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               Container(
//                 width: 800,
//                 decoration: BoxDecoration(
//                   color: AppColors.searchBar,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: AppColors.searchBarBorder,
//                     width: 1.5,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: TextField(
//                         controller: queryController,
//                         decoration: const InputDecoration(
//                           hintText: "Ask Anything...",
//                           hintStyle: TextStyle(
//                             color: AppColors.textGrey,
//                             fontSize: 16,
//                           ),
//                           border: InputBorder.none,
//                           isDense: true,
//                           contentPadding: EdgeInsets.zero,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Row(
//                         children: [
//                           const SearchBarButton(
//                             icon: Icons.auto_awesome_outlined,
//                             text: "Focus",
//                           ),
//                           const SizedBox(width: 12),
//                           const SearchBarButton(
//                             icon: Icons.attach_file_outlined,
//                             text: "Attach",
//                           ),
//                           const Spacer(),
//                           GestureDetector(
//                             onTap: () {
//                               final input = queryController.text.trim();
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => ChatPage(
//                                     question: queryController.text.trim(),
//                                   ),
//                                 ),
//                               );
//                               if (input.isNotEmpty) {
//                                 chatService.chat(input);
//                                 // Optionally clear after send
//                                 queryController.clear();
//                               }
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(12),
//                               decoration: BoxDecoration(
//                                 color: AppColors.submitButton,
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                               child: const Icon(
//                                 Icons.arrow_forward,
//                                 color: AppColors.background,
//                                 size: 18,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class _SearchBarSectionState extends State<SearchBarSection> {
// //   final queryController = TextEditingController();
// //   @override
// //   void dispose() {
// //     super.dispose();
// //     queryController.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Text(
// //           "Where knowledge begins",
// //           style: GoogleFonts.ibmPlexMono(
// //             fontSize: 40,
// //             fontWeight: FontWeight.w500,
// //             height: 1.3,
// //             letterSpacing: -0.5,
// //           ),
// //         ),
// //         SizedBox(height: 32),
// //         Container(
// //           width: 800,
// //           decoration: BoxDecoration(
// //             color: AppColors.searchBar,
// //             borderRadius: BorderRadius.circular(8),
// //             border: Border.all(color: AppColors.searchBarBorder, width: 1.5),
// //           ),
// //           child: Column(
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: TextField(
// //                   controller: queryController,
// //                   decoration: InputDecoration(
// //                     hintText: "Ask Anything..",
// //                     hintStyle: TextStyle(
// //                       color: AppColors.textGrey,
// //                       fontSize: 16,
// //                     ),
// //                     border: InputBorder.none,
// //                     isDense: true,
// //                     contentPadding: EdgeInsets.zero,
// //                   ),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(10.0),
// //                 child: Row(
// //                   children: [
// //                     SearchBarButton(
// //                       icon: Icons.auto_awesome_outlined,
// //                       text: "Focus",
// //                     ),
// //                     SizedBox(width: 12),
// //                     SearchBarButton(
// //                       icon: Icons.attach_file_outlined,
// //                       text: "Attach",
// //                     ),
// //                     Spacer(),
// //                     GestureDetector(
// //                       onTap: () {
// //                         ChatWebService().chat(queryController.text.trim());
// //                       },
// //                       child: Container(
// //                         padding: EdgeInsets.all(10),
// //                         decoration: BoxDecoration(
// //                           color: AppColors.submitButton,
// //                           borderRadius: BorderRadius.circular(40),
// //                         ),
// //                         child: Icon(
// //                           Icons.bar_chart,
// //                           color: AppColors.background,
// //                           size: 16,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_clone/Pages/chat_pages.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/color.dart';
import 'package:perplexity_clone/widget/search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Where knowledge begins',
          style: GoogleFonts.ibmPlexMono(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.searchBarBorder, width: 1.5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: 'Search anything...',
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButton(
                      icon: Icons.auto_awesome_outlined,
                      text: 'Focus',
                    ),
                    const SizedBox(width: 12),
                    SearchBarButton(
                      icon: Icons.add_circle_outline_outlined,
                      text: 'Attach',
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ChatWebService().chat(queryController.text.trim());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatPage(question: queryController.text.trim()),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.background,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
