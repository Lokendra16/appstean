import 'package:appstean_test/module/home/model/user_response.dart';
import 'package:flutter/material.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({
    super.key,
    required this.userList,
  });

  final UserResponse userList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Name: ${userList.name}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )),
              Text(
                "Id: ${userList.id}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Phone: ${userList.phone}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "City: ${userList.address.city}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
