import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("RIWAYAT PESANAN", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1F4E79),
        centerTitle: true,
        automaticallyImplyLeading: false, // Hilangkan tombol back karena ada di tab bawah
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF1F4E79),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari pesanan...",
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: const Color(0xFF2D5C8A), // Warna biru lebih terang
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          
          // List Pesanan
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildHistoryItem("17 Juli 2025", "Cuci Express", "Selesai", "Rp 130.000", true),
                _buildHistoryItem("10 Juni 2025", "Cuci Biasa", "Selesai", "Rp 45.000", false),
                _buildHistoryItem("8 Juni 2025", "Cuci Biasa", "Selesai", "Rp 20.500", false),
                _buildHistoryItem("3 Juni 2025", "Cuci Express", "Selesai", "Rp 30.000", false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String date, String type, String status, String price, bool isHighlighed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF2F7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.local_laundry_service, color: Color(0xFF1F4E79)),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(type, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(status, style: TextStyle(color: Colors.green[600], fontSize: 12)),
                  ],
                ),
              ),
              Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1F4E79))),
            ],
          )
        ],
      ),
    );
  }
}