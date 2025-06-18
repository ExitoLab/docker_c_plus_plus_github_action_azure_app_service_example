# Build a C++ Pipeline with Docker, GitHub Actions, ACR and Azure Web App

This project demonstrates creating a robust CI/CD pipeline for a C++ application using Docker, GitHub Actions, and Azure Container Registry (ACR) and Azure Web App.

## Table of Contents

- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Running the Pipeline](#running-the-pipeline)

## Project Overview

This project provides a CI/CD pipeline for a C++ application with the following capabilities:
- **Code Compilation**: Automates the build process with CMake.
- **Testing**: Runs unit tests using Google Test.
- **Dockerization**: Containerizes the application for deployment.
- **Deployment**: Pushes the Docker image to Azure Container Registry (ACR).

## Technologies Used

- **C++**: For the application code.
- **CMake**: To manage the build system.
- **Google Test**: For writing and running unit tests.
- **Docker**: For containerization.
- **GitHub Actions**: For CI/CD automation.
- **Azure Container Registry**: To store and manage Docker images.

## Prerequisites

- **Docker**: Installed and configured.
- **GitHub Repository**: For hosting the project code and workflows.
- **Run create_federated_identity.sh*** Run this script below which will allow your GitHub Actions workflow to authenticate with Azure using GitHub OIDC (OpenID Connect), it will allow you to push the Docker Image to ACR (Azure Container Registry) and be able to deploy the Docker image to Azure App Service.

## Running the Pipeline
- Commit and push your code to GitHub.
- Monitor the workflow in the GitHub Actions tab.
- Verify the Docker image in your Azure ACR.
