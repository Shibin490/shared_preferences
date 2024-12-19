import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:user_settings/home_screen.dart';
import 'package:user_settings/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserSettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
          theme: settings.darkMode ? ThemeData.dark() : ThemeData.light(),
          home: HomeScreen(),
        );
      },
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final settingsProvider =
//         Provider.of<UserSettingsProvider>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(title: Text("User Settings")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'Username'),
//               onChanged: (value) {
//                 settingsProvider.setUsername(value);
//               },
//               controller:
//                   TextEditingController(text: settingsProvider.username),
//             ),
//             SwitchListTile(
//               title: Text("Dark Mode"),
//               value: settingsProvider.darkMode,
//               onChanged: (value) {
//                 settingsProvider.toggleDarkMode(value);
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                     "Notification Count: ${settingsProvider.notificationCount}"),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.remove),
//                       onPressed: () {
//                         settingsProvider.updateNotificationCount(
//                           settingsProvider.notificationCount > 0
//                               ? settingsProvider.notificationCount - 1
//                               : 0,
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.add),
//                       onPressed: () {
//                         settingsProvider.updateNotificationCount(
//                           settingsProvider.notificationCount + 1,
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
