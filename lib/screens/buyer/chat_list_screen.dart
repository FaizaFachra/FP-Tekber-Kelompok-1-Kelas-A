import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pesan", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1F4E79),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          _buildChatItem("Laundry Gebang Bu Marni", "Halo kak, untuk laundry nya sudah selesai", "10:00", true),
          const Divider(height: 1),
          _buildChatItem("Home Laundry Siska", "Oke siap kak, ditunggu ya", "Kemarin", false),
          const Divider(height: 1),
          _buildChatItem("Laundry Rumah Asri", "Terima kasih kak", "Kemarin", false),
          const Divider(height: 1),
          _buildChatItem("Ibu Tuti Laundry", "Siap diambil kak", "20/11/25", false),
        ],
      ),
    );
  }

  Widget _buildChatItem(String name, String message, String time, bool isUnread) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.grey[200],
        backgroundImage: const NetworkImage("https://i.pravatar.cc/150?img=30"), // Gambar dummy
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis, 
          style: TextStyle(color: isUnread ? Colors.black87 : Colors.grey)),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: TextStyle(fontSize: 12, color: isUnread ? const Color(0xFF1F4E79) : Colors.grey)),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFF1F4E79),
                shape: BoxShape.circle,
              ),
              child: const Center(child: Text("1", style: TextStyle(color: Colors.white, fontSize: 10))),
            )
        ],
      ),
      onTap: () {
        // Nanti bisa diarahkan ke detail chat
      },
    );
  }
}