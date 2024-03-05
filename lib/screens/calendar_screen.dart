// import 'dart:developer';

// import 'package:calendar_timeline/calendar_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:gap/gap.dart';

// import '../extensions/context_extension.dart';
// import '../extensions/widget_extension.dart';
// import '../store/home_state/home_state.dart';
// import '../themes/app_colors.dart';
// import '../widgets/calendar_task_card.dart';

// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({super.key});

//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<CalendarScreen> {
//   HomeState state = HomeState();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.background,
//         body: Column(
//           children: [
//             const Gap(13),
//             Text(
//               'Calendar',
//               style: context.theme.bodyLarge.copyWith(fontSize: 20),
//             ),
//             const Gap(16),
//             Container(
//               width: double.infinity,
//               color: AppColors.bottomNavBar,
//               child: Observer(
//                 builder: (context) {
//                   return CalendarTimeline(
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2023, 1, 2),
//                     lastDate: DateTime(2025, 12, 31),
//                     onDateSelected: (selectedDate) {
//                       state.searchDate = selectedDate;
//                       log('Search date: ${state.searchDate}');
//                     },
//                     leftMargin: 20,
//                     monthColor: Colors.white,
//                     dayColor: AppColors.white,
//                     activeDayColor: Colors.white,
//                     activeBackgroundDayColor: AppColors.purple,
//                     dotsColor: AppColors.white,
//                   );
//                 },
//               ),
//             ),
//             const Gap(20),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 25),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 color: AppColors.darkGrey,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Observer(
//                       builder: (context) {
//                         return ElevatedButton(
//                           onPressed: () {
//                             state.searchDate = DateTime.now();
//                             state.dateFilter;
//                             log('Search date: ${state.searchDate}');
//                             log('Filtered tasks: ${state.dateFilter}');
//                           },
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.transparent),
//                           ),
//                           child: Text(
//                             'Today',
//                             style: context.theme.headlineSmall,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const Gap(32),
//                   Expanded(
//                     child: Observer(
//                       builder: (context) {
//                         return ElevatedButton(
//                           onPressed: () {},
//                           style: const ButtonStyle(
//                             backgroundColor:
//                                 MaterialStatePropertyAll(Colors.transparent),
//                           ),
//                           child: Text(
//                             'Completed',
//                             style: context.theme.headlineSmall,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Gap(15),
//             Expanded(
//               child: ListView.separated(
//                 separatorBuilder: (context, index) => const SizedBox(
//                   height: 16,
//                 ),
//                 itemCount: state.dateFilter.length,
//                 itemBuilder: (context, index) {
//                   return CalendarTaskCard(
//                     index: index,
//                     state: state,
//                   ).paddingOnly(
//                     bottom: index == state.dateFilter.length - 1 ? 35 : 0,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
