import 'package:flutter/material.dart';
import 'package:grpc/grpc_web.dart';
import 'tempconv.pbgrpc.dart';

void main() {
  runApp(const TempConvApp());
}

class TempConvApp extends StatelessWidget {
  const TempConvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const TempConvPage(),
    );
  }
}

class TempConvPage extends StatefulWidget {
  const TempConvPage({super.key});

  @override
  State<TempConvPage> createState() => _TempConvPageState();
}

class _TempConvPageState extends State<TempConvPage> {
  // gRPC-web channel pointing to the backend service.
  // In Kubernetes the backend is exposed via a Service named 'backend';
  // in local dev you can use 'http://localhost:8080' (Envoy proxy port).
  late final TempConvClient _client;

  final _inputController = TextEditingController();
  String _result = '';
  bool _loading = false;
  bool _celsiusToFahrenheit = true;
  bool _useBackend = true; // Toggle between local and backend calculation

  // Local calculation functions
  double _celsiusToFahrenheitLocal(double celsius) {
    return celsius * 9.0 / 5.0 + 32.0;
  }

  double _fahrenheitToCelsiusLocal(double fahrenheit) {
    return (fahrenheit - 32.0) * 5.0 / 9.0;
  }

  @override
  void initState() {
    super.initState();
    // The backend URL is injected at build time via the --dart-define flag:
    //   flutter build web --dart-define=BACKEND_URL=http://<envoy-ip>:8080
    const backendUrl =
        String.fromEnvironment('BACKEND_URL', defaultValue: 'http://localhost:8080');
    final channel = GrpcWebClientChannel.xhr(Uri.parse(backendUrl));
    _client = TempConvClient(channel);
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Future<void> _convert() async {
    final input = double.tryParse(_inputController.text);
    if (input == null) {
      setState(() => _result = 'Please enter a valid number.');
      return;
    }

    setState(() {
      _loading = true;
      _result = '';
    });

    try {
      final stopwatch = Stopwatch()..start();
      
      if (_useBackend) {
        // Backend calculation via gRPC
        if (_celsiusToFahrenheit) {
          final resp = await _client
              .celsiusToFahrenheit(CelsiusRequest(celsius: input));
          stopwatch.stop();
          setState(() =>
              _result = '${resp.fahrenheit.toStringAsFixed(2)} °F\n(Backend: ${stopwatch.elapsedMilliseconds}ms)');
        } else {
          final resp = await _client
              .fahrenheitToCelsius(FahrenheitRequest(fahrenheit: input));
          stopwatch.stop();
          setState(() =>
              _result = '${resp.celsius.toStringAsFixed(2)} °C\n(Backend: ${stopwatch.elapsedMilliseconds}ms)');
        }
      } else {
        // Local calculation
        if (_celsiusToFahrenheit) {
          final result = _celsiusToFahrenheitLocal(input);
          stopwatch.stop();
          setState(() =>
              _result = '${result.toStringAsFixed(2)} °F\n(Local: ${stopwatch.elapsedMicroseconds}μs)');
        } else {
          final result = _fahrenheitToCelsiusLocal(input);
          stopwatch.stop();
          setState(() =>
              _result = '${result.toStringAsFixed(2)} °C\n(Local: ${stopwatch.elapsedMicroseconds}μs)');
        }
      }
    } catch (e) {
      setState(() => _result = 'Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final srcUnit = _celsiusToFahrenheit ? '°C' : '°F';
    final dstUnit = _celsiusToFahrenheit ? '°F' : '°C';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Calculation mode toggle
                SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: false, label: Text('Local')),
                    ButtonSegment(value: true, label: Text('Backend')),
                  ],
                  selected: {_useBackend},
                  onSelectionChanged: (s) {
                    setState(() {
                      _useBackend = s.first;
                      _result = '';
                    });
                  },
                ),
                const SizedBox(height: 16),
                // Direction toggle
                SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: true, label: Text('°C → °F')),
                    ButtonSegment(value: false, label: Text('°F → °C')),
                  ],
                  selected: {_celsiusToFahrenheit},
                  onSelectionChanged: (s) {
                    setState(() {
                      _celsiusToFahrenheit = s.first;
                      _result = '';
                    });
                  },
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _inputController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true, signed: true),
                  decoration: InputDecoration(
                    labelText: 'Temperature ($srcUnit)',
                    border: const OutlineInputBorder(),
                    suffixText: srcUnit,
                  ),
                  onSubmitted: (_) => _convert(),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _loading ? null : _convert,
                    child: _loading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : Text('Convert to $dstUnit'),
                  ),
                ),
                const SizedBox(height: 24),
                if (_result.isNotEmpty)
                  Text(
                    _result,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
