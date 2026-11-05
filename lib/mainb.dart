import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: RegistrationForm(),
    debugShowCheckedModeBanner: false,
  ));
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final formKey = GlobalKey<FormState>();
  String? gender;
  String? course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Form")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter Name" : null,
              ),
              const SizedBox(height: 10),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.contains("@") ? null : "Enter valid Email",
              ),
              const SizedBox(height: 10),

              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.length == 10 ? null : "Enter valid Phone",
              ),
              const SizedBox(height: 10),

              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.length >= 6 ? null : "Minimum 6 characters",
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
                items: ["Male", "Female"].map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  gender = value;
                },
                validator: (value) =>
                    value == null ? "Select Gender" : null,
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Course",
                  border: OutlineInputBorder(),
                ),
                items: ["CSE", "ECE", "IT"].map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  course = value;
                },
                validator: (value) =>
                    value == null ? "Select Course" : null,
              ),
              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Registration Successful"),
                      ),
                    );
                  }
                },
                child: const Text("REGISTER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}