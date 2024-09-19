import 'package:flutter/material.dart';

// Model
class Farmer {
  String name;
  String company;
  String contact;
  String location;
  String notes;

  Farmer({
    this.name = '',
    this.company = '',
    this.contact = '',
    this.location = '',
    this.notes = '',
  });

  Map<String, String> toMap() {
    return {
      'Name': name,
      'Company': company,
      'Contact': contact,
      'Location': location,
      'Notes': notes,
    };
  }
}

// Controller
class FarmerController extends ChangeNotifier {
  final Farmer _farmer = Farmer();

  void updateField(String field, String value) {
    switch (field) {
      case 'Name':
        _farmer.name = value;
        break;
      case 'Company':
        _farmer.company = value;
        break;
      case 'Contact':
        _farmer.contact = value;
        break;
      case 'Location':
        _farmer.location = value;
        break;
      case 'Notes':
        _farmer.notes = value;
        break;
    }
    notifyListeners();
  }

  void clearAll() {
    _farmer.name = "";
    _farmer.company = "";
    _farmer.contact = "";
    _farmer.location = "";
    _farmer.notes = "";
    notifyListeners();
  }

  Map<String, String> getFarmerData() {
    return _farmer.toMap();
  }
}

// View
class FarmersForm extends StatelessWidget {
  final FarmerController controller = FarmerController();

  FarmersForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FARMERS'),
        //backgroundColor: Colors.blue,
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputField('Name', controller),
              _buildInputField('Company', controller),
              _buildInputField('Contact', controller),
              _buildInputField('Location', controller),
              _buildInputField('Notes', controller),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () => _showFormDataDialog(context, controller),
                  ),
                  ElevatedButton(
                      child: const Text('Clear'),
                      onPressed: () => controller.clearAll()),
                ],
              ),
              const SizedBox(height: 15),
              _buildFarmersList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, FarmerController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(gapPadding: 0.00),
          // filled: true,
          // fillColor: Colors.grey[200],
        ),
        onChanged: (value) => controller.updateField(label, value),
      ),
    );
  }

  void _showFormDataDialog(BuildContext context, FarmerController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Map<String, String> farmerData = controller.getFarmerData();
        return AlertDialog(
          title: const Text('Form Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: farmerData.entries
                .map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('${entry.key}: ${entry.value}'),
                    ))
                .toList(),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildFarmersList() {
    final farmers = [
      {
        'Name': 'Sunil',
        'Company': 'ABC Company',
        'Contact': '9098675453',
        'Location': 'Edappal'
      },
      {
        'Name': 'Rajesh',
        'Company': 'XYZ Company',
        'Contact': '9876543211',
        'Location': 'Pattambi'
      },
      {
        'Name': 'Ashraf',
        'Company': 'CAD Company',
        'Contact': '9876543222',
        'Location': 'Thrissur'
      },
      {
        'Name': 'Babu',
        'Company': 'Future Company',
        'Contact': '8877554422',
        'Location': 'Ernakulam'
      },
    ];

    return ListView.builder(
      // shrinkWrap: true,
      // physics: const ScrollPhysics(), //NeverScrollableScrollPhysics(),
      itemCount: farmers.length,
      itemBuilder: (context, index) {
        final farmer = farmers[index];
        return Card(
          child: ExpansionTile(
            leading: CircleAvatar(
              child: Text(farmer['Name']![0].toUpperCase()),
            ),
            title: Text(
                "${farmer['Name']!}  -  ${farmer['Company']!}  -  ${farmer['Location']!}"),
            children: [
              ...farmer.entries.map((entry) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(entry.key,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const Text('  :  '),
                        //const Spacer(),
                        Text(entry.value),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: OverflowBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: const Text('Edit'),
                      onPressed: () {},
                      // style: ElevatedButton.styleFrom(primary: Colors.blue),
                    ),
                    const SizedBox(width: 15.00),
                    ElevatedButton(
                      child: const Text('Delete'),
                      onPressed: () {},
                      //  style: ElevatedButton.styleFrom(primary: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
