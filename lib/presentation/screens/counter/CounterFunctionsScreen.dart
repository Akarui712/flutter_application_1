import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget 
{
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> 
{
  int clickCounter = 0;

  void _sumarUno() 
  {
    setState(() 
    {
      clickCounter++;
    });
  }

  void _restarUno() 
  {
    if (clickCounter == 0) return;
    setState(() 
    {
      clickCounter--;
    });
  }

  void _reiniciarContador() 
  {
    setState(() 
    {
      clickCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Aplicación de contador'),
      ),
      body: Center
      (
        child: _contador
        (
          count: clickCounter,
        ),
      ),
      floatingActionButton: _CounterButtons
      (
        onIncrement: _sumarUno,
        onDecrement: _restarUno,
        onReset: _reiniciarContador
      ),
    );
  }
}

class _contador extends StatelessWidget 
{
  final int count;
  const _contador({required this.count});

  @override
  Widget build(BuildContext context) 
  {
    return Column
    (
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
      [
        Text('$count',
            style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
        Text('Click${count == 1 ? '' : 's'}',
            style: const TextStyle(fontSize: 25))
      ],
    );
  }
}

class _CounterButtons extends StatelessWidget 
{
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;

  const _CounterButtons
  ({
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset
  });

  @override
  Widget build(BuildContext context) 
  {
    return Column
    (
      mainAxisAlignment: MainAxisAlignment.end,
      children: 
      [
        botonesPerzonalizados
        (
          icon: Icons.exposure_plus_1_outlined,
          onPressed: onIncrement,
        ),
        const SizedBox(height: 10),
        botonesPerzonalizados
        (
          icon: Icons.exposure_minus_1_outlined,
          onPressed: onDecrement,
        ),
        const SizedBox(height: 10),
        botonesPerzonalizados
        (
          icon: Icons.refresh_rounded,
          onPressed: onReset,
        ),
      ],
    );
  }
}

class botonesPerzonalizados extends StatelessWidget 
{
  final IconData icon;
  final VoidCallback? onPressed;

  const botonesPerzonalizados({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) 
  {
    return FloatingActionButton
    (
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}