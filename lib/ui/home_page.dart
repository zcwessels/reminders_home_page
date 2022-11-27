import 'package:flutter/material.dart';
import 'package:reminder_app_home_page/helpers/hex_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _mainLightColor = HexColor('#FF715B');
  final Color _darkBlue = HexColor('#17181C');

  final TextStyle _heading1 = const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800);
  final TextStyle _heading2 = const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle _subtitle1 = const TextStyle(color: Colors.black38, fontSize: 12, fontWeight: FontWeight.bold);
  final TextStyle _subtitle2 = const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold);

  final List<Map<String, dynamic>> _reminders = [
    {
      'title': 'Send money',
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
      'toggle': true,
    },
    {
      'title': 'Take dogs for a walk',
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
      'toggle': true,
    },
    {
      'title': 'Goto car wash',
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
      'toggle': true,
    },
    {
      'title': 'Go Fishing',
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
      'toggle': true,
    },
    {
      'title': 'Look at Twitter',
      'body': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
      'toggle': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hello, Zander', style: _heading1),
                    const SizedBox(height: 8),
                    Text('Today you have 10 Reminders', style: _subtitle1),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: CircleAvatar(
                    backgroundColor: _mainLightColor,
                    child: ClipOval(
                      child: Image.network('https://avatars.githubusercontent.com/u/31216542?v=4', scale: 9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: _reminders.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> reminder = _reminders[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {
                  reminder['toggle'] = !reminder['toggle'];
                  setState(() {});
                },
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: (reminder['toggle']) ? 80 : 300,
                    decoration: BoxDecoration(
                      color: (reminder['toggle']) ? Colors.white : _mainLightColor,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      border: Border.all(color: _darkBlue, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 230, child: Text(reminder['title'], style: _heading2, maxLines: 1, overflow: TextOverflow.ellipsis)),
                                const Spacer(),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                                    border: Border.all(color: _darkBlue, width: 2),
                                  ),
                                  child: Center(
                                    child: (reminder['toggle']) ? const Icon(Icons.add) : const Icon(Icons.remove),
                                  ),
                                )
                              ],
                            ),
                            Expanded(child: Text(reminder['body'], style: _subtitle2)),
                          ],
                        ),
                      ),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
