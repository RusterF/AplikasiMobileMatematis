import 'package:flutter/material.dart';

class DigitCounter extends StatefulWidget {
  const DigitCounter({super.key});

  @override
  _DigitCounterState createState() => _DigitCounterState();
}

class _DigitCounterState extends State<DigitCounter> {
  final TextEditingController _controller = TextEditingController();
  int _digitCount = 0;
  String _errorMessage = '';

  void _countDigits() {
    String input = _controller.text;
    if (RegExp(r'^[0-9]+$').hasMatch(input)) {
      setState(() {
        _digitCount = input.length;
        _errorMessage = '';
      });
    } else {
      setState(() {
        _errorMessage = 'Angka Tidak Valid';
        _digitCount = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Text(
          "Hitung Jumlah Digit",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(
                    Icons.calculate_rounded,
                    size: 80,
                    color: Colors.indigo[400],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Cek Jumlah Digit Angka',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Masukkan angka untuk menghitung jumlah digitnya',
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan angka',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
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
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _countDigits,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[600],
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Hitung Digit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AnimatedOpacity(
                opacity: _errorMessage.isNotEmpty || _digitCount > 0 ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: _errorMessage.isNotEmpty
                        ? Colors.red[50]
                        : Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _errorMessage.isNotEmpty
                          ? Colors.red[200]!
                          : Colors.blue[200]!,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _errorMessage.isNotEmpty
                            ? Icons.dangerous_outlined
                            : Icons.check_circle_outlined,
                        color: _errorMessage.isNotEmpty
                            ? Colors.red[600]
                            : Colors.blue[600],
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _errorMessage.isNotEmpty
                            ? _errorMessage
                            : 'Jumlah Digit: $_digitCount',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _errorMessage.isNotEmpty
                              ? Colors.red[600]
                              : Colors.blue[600],
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
