import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'navigator_controller.dart';
//
// class NavigatorMenu extends StatelessWidget {
//   const NavigatorMenu({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigatorController());
//
//     return Scaffold(
//       bottomNavigationBar: Obx(
//             () => NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) => controller.selectedIndex.value = index,
//           destinations: const [
//             NavigationDestination(
//               icon: Icon(Icons.home_outlined),
//               selectedIcon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.book_outlined),
//               selectedIcon: Icon(Icons.book),
//               label: 'Courses',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.schedule_outlined),
//               selectedIcon: Icon(Icons.schedule),
//               label: 'Schedule',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.chat_outlined),
//               selectedIcon: Icon(Icons.chat),
//               label: 'Messages',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.person_outline),
//               selectedIcon: Icon(Icons.person),
//               label: 'Profile',
//             )
//           ],
//         ),
//       ),
//       // Wrap body in Obx to make it reactive
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//     );
//   }
// }
//


class NavigatorMenu extends StatelessWidget {
  const NavigatorMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatorController());

    return Obx(() {
      return WillPopScope(
        onWillPop: () async {
          final canPop = controller
              .navigatorKeys[controller.selectedIndex.value]
              .currentState!
              .canPop();
          if (canPop) {
            controller
                .navigatorKeys[controller.selectedIndex.value]
                .currentState!
                .pop();
            return false;
          }
          return true;
        },
        child: Scaffold(
          body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: controller.screens,
          )),

          bottomNavigationBar: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
            controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.book_outlined), label: 'Courses'),
              NavigationDestination(
                  icon: Icon(Icons.schedule_outlined), label: 'Schedule'),
              NavigationDestination(
                  icon: Icon(Icons.chat_outlined), label: 'Messages'),
              NavigationDestination(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ],
          ),
        ),
      );
    });
  }
}

