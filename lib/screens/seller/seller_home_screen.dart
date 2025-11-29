import 'package:flutter/material.dart';
import 'seller_order_list_screen.dart'; // Import
import 'scan_screen_dummy.dart';        // Import
import 'add_order_screen.dart';         // Import

class SellerHomeScreen extends StatelessWidget {
  final String username;

  const SellerHomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F4E79),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0, left: 0, right: 0, height: 300,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1545173168-9f1947eebb8f?q=80&w=2071&auto=format&fit=crop"), 
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          
          // Header Text
          Positioned(
            top: 50, left: 20, right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("LAUNDRYIN", style: TextStyle(color: Colors.white70, fontSize: 12, letterSpacing: 2)),
                const SizedBox(height: 5),
                Text("Halo $username !", style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Main Card (Jumlah Pesanan)
          Positioned(
            top: 140, left: 24, right: 24,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    const Text("Jumlah Pesanan Laundry", style: TextStyle(color: Color(0xFF1F4E79), fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    const Text("3", style: TextStyle(color: Color(0xFF1F4E79), fontSize: 80, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text("Pengambilan Terdekat : 20 Juli 2025", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),

          // Menu Buttons (SUDAH DIHUBUNGKAN)
          Positioned(
            top: 420, left: 24, right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol Daftar Pesanan
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SellerOrderListScreen())),
                  child: _buildSquareButton(Icons.assignment_outlined, "Daftar\nPesanan"),
                ),
                // Tombol Riwayat (Dummy)
                _buildSquareButton(Icons.history, "Riwayat"),
              ],
            ),
          ),

          // Scan Button (SUDAH DIHUBUNGKAN)
          Positioned(
            top: 540, left: 24, right: 24,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScanScreenDummy())),
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.qr_code_scanner, size: 35, color: Color(0xFF1F4E79)),
                    SizedBox(height: 5),
                    Text("Scan QR Pelanggan", style: TextStyle(color: Color(0xFF1F4E79), fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareButton(IconData icon, String label) {
    return Container(
      width: 150, height: 100,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: const Color(0xFF1F4E79)),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF1F4E79), fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}