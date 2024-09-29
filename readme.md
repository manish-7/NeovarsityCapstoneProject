# Ecommerce Product Management Service

Welcome to the **Ecommerce Product Management Service**! This microservice is designed to handle all aspects of product management within an ecommerce platform, including product details, categorization, and more.

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Prerequisites](#prerequisites)
- [Setup & Installation](#setup--installation)
- [Configuration](#configuration)
- [Starting the Service](#starting-the-service)
- [API Usage](#api-usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

The **Ecommerce Product Management Service** is a RESTful microservice responsible for performing all CRUD operations (Create, Read, Update, Delete) related to products in an ecommerce ecosystem. This service supports managing product data, categories, and user authentication.

## Key Features

- **Product Management**: Create, update, and delete product records.
- **Product Retrieval**: Fetch detailed product information.
- **Category Management**: Organize and manage products by categories.
- **User Authentication**: Secure the service with user authentication via tokens.

## Prerequisites

Before setting up the service, ensure the following tools are installed:

- **Java** (v17 or later)
- **MySQL** (for database management)
- **Maven** (for dependency management)

## Setup & Installation

To get the project up and running, follow these steps:

1. Clone the repository:

    ```bash
    git clone git@github.com:manish-7/NeovarsityCapstoneProject.git
    cd productmanagementservice
    ```

2. Install dependencies:

    ```bash
    mvn clean install
    ```

## Configuration

Configure the database and other service parameters by updating the `application.properties` file located in the project directory:

```properties
spring.datasource.url=jdbc:<your_db_url> # Example: mysql://localhost:3306/productmanagementservice
spring.datasource.username=<your_db_username>
spring.datasource.password=<your_db_password>
```

## Starting the Service

1. Ensure your MySQL service is running:

    ```bash
    net start mysql
    ```

2. Start the application from the main class. Once launched, the service will be accessible at:

    ```
    http://localhost:8080
    ```

## API Usage

Once the service is up and running, use the following API endpoints to interact with the product data:

### Product Endpoints
- **GET /products**: Fetch all products.
- **GET /products/{id}**: Retrieve details of a specific product by its ID.
- **POST /products**: Add a new product.
- **PUT /products/{id}**: Update an existing product.
- **DELETE /products/{id}**: Delete a product.

For additional endpoints (e.g., authentication, payments), please refer to their respective controller documentation.

## Contributing

We welcome all contributions! Please check out our [Contributing Guidelines](CONTRIBUTING.md) to learn more about how to contribute to this project.

## License

This project is licensed under the MIT License. For details, please refer to the [LICENSE](LICENSE) file.
