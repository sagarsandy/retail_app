import 'package:flutter/material.dart';
import 'package:retail_admin/core/presentation/widgets/ss_text_field_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/widgets/ss_button_widget.dart';

class AddCafePage extends StatefulWidget {
  const AddCafePage({super.key});

  @override
  State<AddCafePage> createState() => _AddCafePageState();
}

class _AddCafePageState extends State<AddCafePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _addressController = TextEditingController();
  final _locationLatitudeController = TextEditingController();
  final _locationLongitudeController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _durationController = TextEditingController();
  final _openingTimeController = TextEditingController();
  final _closingTimeController = TextEditingController();
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _addressController.dispose();
    _locationLatitudeController.dispose();
    _locationLongitudeController.dispose();
    _contactNumberController.dispose();
    _durationController.dispose();
    _openingTimeController.dispose();
    _closingTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.surface,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Add Cafe"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel("Cafe Name"),
                      SSTextFieldWidget(
                        isRequired: true,
                        title: "name",
                        hint: "Enter cafe name",
                        controller: _nameController,
                      ),
                      const SizedBox(height: 16),
                      _buildLabel("Cafe Image"),
                      SSTextFieldWidget(
                        isRequired: true,
                        title: "image url",
                        hint: "Enter image url",
                        controller: _imageUrlController,
                      ),
                      const SizedBox(height: 16),
                      _buildLabel("Cafe Address"),
                      SSTextFieldWidget(
                        isRequired: true,
                        title: "address",
                        hint: "Enter address",
                        controller: _addressController,
                      ),
                      const SizedBox(height: 16),
                      _buildLabel("Cafe Location"),
                      Row(
                        children: [
                          Expanded(
                            child: SSTextFieldWidget(
                              isRequired: true,
                              title: "latitude",
                              hint: "Enter latitude",
                              controller: _locationLatitudeController,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SSTextFieldWidget(
                              isRequired: true,
                              title: "longitude",
                              hint: "Enter longitude",
                              controller: _locationLongitudeController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildLabel("Contact Number"),
                      SSTextFieldWidget(
                        isRequired: true,
                        title: "phone number",
                        hint: "Enter contact number",
                        controller: _contactNumberController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      _buildLabel("Timings"),
                      Row(
                        children: [
                          Expanded(
                            child: SSTextFieldWidget(
                              isRequired: true,
                              title: "open time",
                              hint: "Enter opening time",
                              controller: _openingTimeController,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: SSTextFieldWidget(
                              isRequired: true,
                              title: "closing time",
                              hint: "Enter closing time",
                              controller: _closingTimeController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildLabel("Duration"),
                      SSTextFieldWidget(
                        isRequired: true,
                        title: "duration",
                        hint: "Enter duration to prepare food",
                        controller: _durationController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      _buildLabel(
                        "Cafe Description",
                        isRequired: false,
                      ),
                      SSTextFieldWidget(
                        isRequired: false,
                        title: "description",
                        hint: "Enter cafe description",
                        controller: _descriptionController,
                        maxLines: 3,
                        height: 120,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: SSButtonWidget(
                          title: "Submit",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Cafe Submitted')),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text + (isRequired ? '*' : ''),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
