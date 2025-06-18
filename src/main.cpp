#include <iostream>
#include <vector>
#include <numeric>
#include <string>

#include "crow.h"

// Function to calculate the average of a list of numbers
double calculate_average(const std::vector<int>& numbers) {
    if (numbers.empty()) return 0.0;
    int sum = std::accumulate(numbers.begin(), numbers.end(), 0);
    return static_cast<double>(sum) / numbers.size();
}

int main() {
    // First, run the original console output
    std::vector<int> numbers = {10, 20, 30, 40, 50};
    double average = calculate_average(numbers);
    std::cout << "The average is: " << average << std::endl;

    // Now, start the web server with Crow
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([numbers](){
        double average = calculate_average(numbers);
        return "The average is: " + std::to_string(average);
    });

    app.port(8080).multithreaded().run();
}
