// // import 'package:flutter/material.dart';
// // import 'package:perplexity_clone/theme/color.dart';

// // class SideBarButton extends StatelessWidget {
// //   const SideBarButton({
// //     super.key,
// //     required this.isCollapsed,
// //     required this.icon,
// //     required this.text,
// //   });

// //   final bool isCollapsed;
// //   final IconData icon;
// //   final String text;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: isCollapsed
// //           ? MainAxisAlignment.center
// //           : MainAxisAlignment.start,
// //       children: [
// //         Container(
// //           margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
// //           child: Icon(icon, color: AppColors.iconGrey, size: 22),
// //         ),
// //         isCollapsed
// //             ? SizedBox()
// //             : Text(
// //                 text,
// //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// //               ),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:perplexity_clone/theme/color.dart';

// class SideBarButton extends StatelessWidget {
//   const SideBarButton({
//     super.key,
//     required this.isCollapsed,
//     required this.icon,
//     required this.text,
//   });

//   final bool isCollapsed;
//   final IconData icon;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: isCollapsed
//             ? MainAxisAlignment.center
//             : MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Icon(icon, color: AppColors.iconGrey, size: 22),
//           ),
//           if (!isCollapsed)
//             Text(
//               text,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.textGrey,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/color.dart';

class SideBarButton extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String text;
  const SideBarButton({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCollapsed
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(icon, color: AppColors.iconGrey, size: 22),
        ),
        isCollapsed
            ? const SizedBox()
            : Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
      ],
    );
  }
}
