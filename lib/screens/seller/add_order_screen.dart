import 'package:flutter/material.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final TextEditingController _nameController = TextEditingController();
  // Checkbox states
  bool isKiloan = false;
  bool isSatuan = false;
  bool isBedcover = false;
  bool isExpress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pesanan", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1F4E79),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nama Pelanggan", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Masukkan nama...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            
            const Text("Pilih Layanan", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            
            _buildCheckbox("Cuci Kiloan (Reguler)", isKiloan, (val) => setState(() => isKiloan = val!)),
            _buildCheckbox("Cuci Satuan (Jas/Gaun)", isSatuan, (val) => setState(() => isSatuan = val!)),
            _buildCheckbox("Bedcover / Selimut", isBedcover, (val) => setState(() => isBedcover = val!)),
            
            const Divider(),
            _buildCheckbox("Layanan Express (1 Hari)", isExpress, (val) => setState(() => isExpress = val!)),
            
            const SizedBox(height: 30),
            
            // Total Harga Dummy
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Estimasi Total:", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Rp 45.000", style: TextStyle(color: Color(0xFF1F4E79), fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Tampilkan Dialog Sukses [cite: 413]
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(color: Colors.green[100], shape: BoxShape.circle),
                            child: const Icon(Icons.check, color: Colors.green, size: 40),
                          ),
                          const SizedBox(height: 20),
                          const Text("Pesanan Berhasil!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 10),
                          const Text("Data pesanan telah masuk ke daftar aktif."),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                            Navigator.pop(context); // Balik ke Home
                          },
                          child: const Text("OK, Kembali"),
                        )
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1F4E79)),
                child: const Text("Buat Pesanan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox(String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFF1F4E79),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}