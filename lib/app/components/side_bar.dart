import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripple_car_frontend/app/components/clock.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = List<int>.generate(10, (i) => i + 1);

    return SizedBox(
      width: Get.width * 0.8,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 240,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    _rowDrawerHeader(
                      Icons.access_time,
                      const Clock(),
                      'Horário do servidor',
                    ),
                    const Divider(),
                    _rowDrawerHeader(
                      Icons.home,
                      const Text('Em breve'),
                      'Em breve',
                    ),
                  ],
                ),
              ),
            ),
            _listTile(
              'title',
              'subtitle',
              Icons.home,
              () => {},
            ),
            _listTile(
              'back',
              'go back',
              Icons.arrow_back,
              Get.back<dynamic>,
            ),
            for (var item in list) ...[
              _listTile(
                item.toString(),
                item.toString(),
                Icons.list,
                () {},
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _rowDrawerHeader(IconData icon, Widget widget, String subtitle) {
    return Row(
      children: [
        Expanded(
          child: Icon(
            icon,
            color: Colors.black,
            size: 15,
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget,
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listTile(
      String title, String subtitle, IconData icon, VoidCallback callback) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black,
          height: 0,
        ),
      ),
      onTap: callback,
    );
  }
}
