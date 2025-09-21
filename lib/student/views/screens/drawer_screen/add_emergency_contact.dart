import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddEmergencyContactScreen extends StatefulWidget {
  @override
  _AddEmergencyContactScreenState createState() => _AddEmergencyContactScreenState();
}

class _AddEmergencyContactScreenState extends State<AddEmergencyContactScreen> {
  final Color primaryColor = AppColor.primary;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _saveContact() {
    if (_formKey.currentState!.validate()) {
      // Add logic to save contact
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Contact Saved Successfully")),
      );

      // Optionally pop screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        backgroundColor: AppColor.primary,
        image: "assets/images/drawer_emergency_img.png",
        imageColor: AppColor.white,
        imageWidth: 40,imageHeight: 40,
        title: "ADD EMERGENCY CONTACT",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),

              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: "e.g. Rajesh Kumar",
                  prefixIcon: Icon(Icons.person, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                value!.isEmpty ? "Please enter name" : null,
              ),

              const SizedBox(height: 20),

              // Relation Field
              TextFormField(
                controller: _relationController,
                decoration: InputDecoration(
                  labelText: "Relation",
                  hintText: "e.g. Father, Mother, Brother",
                  prefixIcon: Icon(Icons.group, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                value!.isEmpty ? "Please enter relation" : null,
              ),

              const SizedBox(height: 20),

              // Phone Number Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "+91 9876543210",
                  prefixIcon: Icon(Icons.phone, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Please enter phone number";
                  if (value.length < 10) return "Enter valid phone number";
                  return null;
                },
              ),

              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.save, color: AppColor.white),
                  label: const Text(
                    "Save Contact",
                    style: TextStyle(color: AppColor.white, fontSize: 16),
                  ),
                  onPressed: _saveContact,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
