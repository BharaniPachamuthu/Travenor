import 'package:flutter/material.dart';

class SantoriniCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://via.placeholder.com/300x150', // Replace with your image URL
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Santorini Islnd',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                '16 July - 28 July',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, size: 16, color: Colors.amber),
              SizedBox(width: 4),
              Text(
                '4.8',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                '\$820',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage('https://via.placeholder.com/24'),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage('https://via.placeholder.com/24'),
                    ),
                  ),
                  Positioned(
                    left: 32,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage('https://via.placeholder.com/24'),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 48),
              Text(
                '24 Person Joined',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
