import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://plant.id/api/v3/identification";
  final String apiKey = "gdME5kXb393bSxTqcgWgowwqsUO7sIcAF0IXbxpNZk2ZsUk5Hh";

  Future<void> fetchPlantDiseaseDetection(BuildContext context, String imageUrl) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Api-Key': apiKey,
        },
        body: jsonEncode({
          'images': [imageUrl],
          'latitude': 49.207,
          'longitude': 16.608,
          'similar_images': true,
        }),
      );

      if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);

        // Check if the response structure contains the expected data
        if (jsonData['result'] != null &&
            jsonData['result']['is_plant'] != null &&
            jsonData['result']['classification'] != null &&
            jsonData['result']['classification']['suggestions'] != null) {
          bool isPlant = jsonData['result']['is_plant']['binary'];
          double plantProbability = jsonData['result']['is_plant']['probability'];
          List suggestions = jsonData['result']['classification']['suggestions'];

          String plantName = suggestions.isNotEmpty ? suggestions[0]['name'] : "Unknown Plant";
          double plantHealthProbability = suggestions.isNotEmpty ? suggestions[0]['probability'] : 0.0;

          // Additional logic to determine health
          String healthStatus;
          if (plantHealthProbability > 0.7) {
            healthStatus = "Healthy";
          } else if (plantHealthProbability > 0.5) {
            healthStatus = "Possibly Healthy";
          } else {
            healthStatus = "Unhealthy";
          }

          String resultMessage;
          if (isPlant && plantProbability >= 0.5) {
            resultMessage = "Detected plant: $plantName\nHealth Status: $healthStatus";
          } else {
            resultMessage = "No plant detected.";
          }

          // Display the result in a dialog or any UI component
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Plant Disease Detection Result"),
                content: Text(resultMessage),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
          // Handle unexpected response structure
          showErrorDialog(context, "Unexpected response structure");
        }
      } else {
        // Handle error response
        showErrorDialog(context, "Error: ${response.statusCode}");
      }
    } catch (e) {
      // Handle exceptions
      showErrorDialog(context, "Exception: $e");
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


