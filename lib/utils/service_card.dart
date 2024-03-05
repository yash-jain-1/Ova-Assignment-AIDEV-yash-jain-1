import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String logoPath;
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.serviceName,
    required this.logoPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                logoPath,
                height: 80.0,
                width: 80.0,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10.0),
              Text(
                serviceName,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}