import 'package:flutter/material.dart';

class GanjilGenapScreen extends StatefulWidget {
  const GanjilGenapScreen({super.key});

  @override
  State<GanjilGenapScreen> createState() => _GanjilGenapScreenState();
}

class _GanjilGenapScreenState extends State<GanjilGenapScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  Color _resultColor = Colors.black;

  void _checkNumber() {
    if (_controller.text.isEmpty) {
      setState(() {
        _result = "Masukkan angka terlebih dahulu";
        _resultColor = Colors.red;
      });
      return;
    }

    try {
      final BigInt? number = BigInt.tryParse(_controller.text);
      if (number == null || number.isNegative || number == BigInt.zero) {
        setState(() {
          _result = 'Masukkan angka bilangan bulat positif';
          _resultColor = Colors.red;
        });
      } else {
        setState(() {
          if (number.isEven) {
            _result = "Genap";
            _resultColor = Colors.blue;
          } else {
            _result = "Ganjil";
            _resultColor = Colors.purple;
          }
        });
      }
    } catch (e) {
      setState(() {
        _result = "Input tidak valid";
        _resultColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Ganjil Genap",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Illustration
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(
                    Icons.calculate_outlined,
                    size: 80,
                    color: Colors.indigo[400],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Title
              Text(
                'Cek Angka Ganjil atau Genap',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              // Subtitle
              Text(
                'Masukkan angka untuk mengetahui apakah termasuk ganjil atau genap',
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Input field
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan angka',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.indigo[400]!,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _checkNumber,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[600],
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Periksa Angka',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Result
              AnimatedOpacity(
                opacity: _result.isEmpty ? 0 : 1,
                duration: Duration(milliseconds: 300),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color:
                        _result == "Ganjil"
                            ? Colors.purple[50]
                            : _result == "Genap"
                            ? Colors.blue[50]
                            : Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                          _result == "Ganjil"
                              ? Colors.purple[200]!
                              : _result == "Genap"
                              ? Colors.blue[200]!
                              : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _result == "Ganjil" || _result == "Genap"
                          ? Icon(
                            _result == "Ganjil"
                                ? Icons.looks_one
                                : Icons.looks_two,
                            color: _resultColor,
                            size: 24,
                          )
                          : SizedBox(),
                      SizedBox(
                        width:
                            _result == "Ganjil" || _result == "Genap" ? 12 : 0,
                      ),
                      Flexible(
                        child: Text(
                          _result,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _resultColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
