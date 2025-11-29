import 'package:flutter/material.dart';

class SellerOrderListScreen extends StatelessWidget {
  const SellerOrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Pesanan Aktif", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1F4E79),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOrderItem(context, "Samid", "Cuci Kiloan (5kg)", "Sedang Dicuci", Colors.blue),
          _buildOrderItem(context, "Bu Marni", "Bedcover King", "Disetrika", Colors.orange),
          _buildOrderItem(context, "Pak Rahmat", "Cuci Satuan (Jas)", "Menunggu", Colors.grey),
        ],
      ),
    );
  }

  Widget _buildOrderItem(BuildContext context, String name, String item, String status, Color statusColor) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF1F4E79),
          child: Text(name[0], style: const TextStyle(color: Colors.white)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: statusColor),
              ),
              child: Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigasi ke Detail (Nanti kita buat simpel aja pakai dialog)
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Detail Pesanan: $name"),
              content: const Text("Status: Proses Laundry.\n\nKlik 'Update Status' untuk mengubah progress."),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Tutup")),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context), 
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1F4E79)),
                  child: const Text("Update Status", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}