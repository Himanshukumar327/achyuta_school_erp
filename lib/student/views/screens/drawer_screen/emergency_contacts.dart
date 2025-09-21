import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/screens/drawer_screen/add_emergency_contact.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyContactScreen extends StatelessWidget {
  final Color primaryColor = AppColor.primary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        backgroundColor: AppColor.primary,
        image: "assets/images/drawer_emergency_img.png",
        imageColor: AppColor.white,
        imageWidth: 40,imageHeight: 40,
        title: "EMERGENCY CONTACT",
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Info Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor.withOpacity(0.1),
                    primaryColor.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: primaryColor, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Add trusted contacts (like a parent, guardian, or close relative) who should be contacted during emergencies. This helps ensure the student's safety.",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Contact List or Empty State
            Expanded(
              child: ListView(
                children: [
                  ContactCard(
                    name: "Father - John Doe",
                    phone: "+1 123 456 7890",
                    color: primaryColor,
                  ),
                  ContactCard(
                    name: "Mother - Jane Smith",
                    phone: "+1 098 765 4321",
                    color: primaryColor,
                  ),
                  ContactCard(
                    name: "Brother - Alex Doe",
                    phone: "+1 456 789 1230",
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(()=> AddEmergencyContactScreen());
        },
        backgroundColor: primaryColor,
        icon: const Icon(Icons.add, color: AppColor.white),
        label: const Text("Add Contact", style: TextStyle(color: AppColor.white)),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final Color color;

  const ContactCard({
    required this.name,
    required this.phone,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      color: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: color,
          child: const Icon(Icons.person, color: AppColor.white, size: 28),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(phone),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.call, color: Colors.green),
              onPressed: () {
                // Call action
              },
            ),
          ],
        ),
      ),
    );
  }
}
