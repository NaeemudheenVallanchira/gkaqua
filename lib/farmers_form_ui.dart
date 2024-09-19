import 'package:flutter/material.dart';

import 'models.dart';

class FarmersForm extends StatelessWidget {
  final Farmer farmer = Farmer.empty();
  FarmersForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FARMERS'),
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputField('Name', (value) => farmer.name = value),
              _buildInputField('Company', (value) => farmer.company = value),
              _buildInputField('Contact', (value) => farmer.contact = value),
              _buildInputField('Location', (value) => farmer.location = value),
              _buildInputField('Notes', (value) => farmer.notes = value),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  print(farmer.toString());
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            children: [
                              const Text(
                                'Do you want to save ?',
                              ),
                              _buildInputField(
                                  'Name', (value) => farmer.name = value),
                              _buildInputField(
                                  'Company', (value) => farmer.company = value),
                              _buildInputField(
                                  'Contact', (value) => farmer.contact = value),
                              _buildInputField('Location',
                                  (value) => farmer.location = value),
                              _buildInputField(
                                  'Notes', (value) => farmer.notes = value),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('YES'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              child: const Text('NO'),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                            ),
                          ],
                        );
                      });
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 20),
              _buildTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, Function onChange) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        onChanged: (value) => onChange(value),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          // filled: true,
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Table(
      border: TableBorder.all(),
      children: [
        _buildTableHeader(),
        _buildTableRow('ani', 'AN', '9098675453', 'Edappal'),
        _buildTableRow('babu', 'BA', '9876543211', 'Pattambi'),
        _buildTableRow('cini', 'CI', '9876543222', 'Thrissur'),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      // decoration: const BoxDecoration(color: Colors.blue),
      children: ['Name', 'Company', 'Contact', 'Location', 'Activities']
          .map((header) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(header,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold) //, color: Colors.white),
                      ),
                ),
              ))
          .toList(),
    );
  }

  TableRow _buildTableRow(
      String name, String company, String contact, String location) {
    return TableRow(
      children: [
        _buildTableCell(name),
        _buildTableCell(company),
        _buildTableCell(contact),
        _buildTableCell(location),
        TableCell(
          child: Wrap(
            direction: Axis.horizontal,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
