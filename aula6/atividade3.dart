// atividade3.dart / main.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Classe modelo baseada no slide da aula
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  String toJson() {
    Map<String, dynamic> input = {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body,
    };
    return jsonEncode(input);
  }

  static Post fromJson(Map<String, dynamic> item) {
    return Post(item['userId'], item['id'], item['title'], item['body']);
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP Demo - Atividade 3',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HttpScreen(),
    );
  }
}

class HttpScreen extends StatefulWidget {
  const HttpScreen({super.key});

  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  String resultText = "Nenhuma operação realizada ainda.";
  bool isLoading = false;

  final String baseUrl = 'jsonplaceholder.typicode.com';

  void _setLoading(bool state) {
    setState(() {
      isLoading = state;
    });
  }

  // GET único
  Future<void> fetchSinglePost() async {
    _setLoading(true);
    final url = Uri.https(baseUrl, 'posts/1');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final post = Post.fromJson(jsonDecode(response.body));
        setState(() => resultText = "GET (Único):\n${post.title}");
      }
    } catch (e) {
      setState(() => resultText = "Erro: $e");
    }
    _setLoading(false);
  }

  // GET (Lista)
  Future<void> fetchPostList() async {
    _setLoading(true);
    final url = Uri.https(baseUrl, 'posts');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        setState(() => resultText = "GET (Lista):\nRecuperou ${jsonList.length} itens.");
      }
    } catch (e) {
      setState(() => resultText = "Erro: $e");
    }
    _setLoading(false);
  }

  // POST
  Future<void> createPost() async {
    _setLoading(true);
    final url = Uri.https(baseUrl, 'posts');
    try {
      final response = await http.post(
        url,
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'title': 'Novo Título do IFSP',
          'body': 'Corpo do post criado na aula.',
          'userId': 1,
        }),
      );
      if (response.statusCode == 201) {
        setState(() => resultText = "POST (Criar):\nCriado com sucesso! Status ${response.statusCode}\nResposta: ${response.body}");
      }
    } catch (e) {
      setState(() => resultText = "Erro: $e");
    }
    _setLoading(false);
  }

  // PUT
  Future<void> updatePost() async {
    _setLoading(true);
    final url = Uri.https(baseUrl, 'posts/1');
    try {
      final response = await http.put(
        url,
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'id': 1,
          'title': 'Título Atualizado',
          'body': 'Atualizando dados com PUT',
          'userId': 1,
        }),
      );
      if (response.statusCode == 200) {
        setState(() => resultText = "PUT (Atualizar):\nAtualizado! Status ${response.statusCode}\nResposta: ${response.body}");
      }
    } catch (e) {
      setState(() => resultText = "Erro: $e");
    }
    _setLoading(false);
  }

  // DELETE
  Future<void> deletePost() async {
    _setLoading(true);
    final url = Uri.https(baseUrl, 'posts/1');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        setState(() => resultText = "DELETE (Remover):\nDeletado! Status ${response.statusCode}");
      }
    } catch (e) {
      setState(() => resultText = "Erro: $e");
    }
    _setLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Requisições HTTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(onPressed: fetchSinglePost, child: const Text('GET Único')),
                ElevatedButton(onPressed: fetchPostList, child: const Text('GET Lista')),
                ElevatedButton(onPressed: createPost, child: const Text('POST')),
                ElevatedButton(onPressed: updatePost, child: const Text('PUT')),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red[300]), onPressed: deletePost, child: const Text('DELETE', style: TextStyle(color: Colors.white))),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Resultado da Operação:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(child: Text(resultText)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}