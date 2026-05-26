import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DevVenture"),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.deepPurple.shade100, width: 2),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5))],
              ),
              child: Row(
                children: [
                  Container(
                    width: 60, height: 60,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.deepPurple, width: 2)),
                    child: const Center(child: Text("NA", style: TextStyle(color: Colors.deepPurple, fontSize: 20, fontWeight: FontWeight.bold))),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Nome Aluno", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("Nível 14 - ARQUIMAGO", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.deepPurple.shade50, borderRadius: BorderRadius.circular(20)),
                    child: const Text("Pleno", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const Text("DASHBOARD DE TRILHAS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Continue sua jornada acadêmica..."),
            const SizedBox(height: 15),

            // CARDS DAS TRILHAS
            _buildTrilhaCard("Dart", "Domine a sintaxe fundamental, coleções...", 0.7),
            _buildTrilhaCard("Flutter", "Desenvolva interfaces de alta performance...", 0.4),
            _buildTrilhaCard("Firebase", "Integre autenticação e banco de dados...", 0.2),

            const SizedBox(height: 20),
            const Text("RECENTES", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // LISTA DE RECENTES
            ListTile(
              title: const Text("> Widgets Customizados"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            ListTile(
              title: const Text("> Configuração Cloud Firestore"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrilhaCard(String title, String subtitle, double progress) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.code, color: Colors.deepPurple, size: 40),
              title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                color: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade50
            ),
          ],
        ),
      ),
    );
  }
}