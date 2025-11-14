# Product REST API

A RESTful API built with Spring Boot for managing products, using PostgreSQL as the database and Docker for containerization.

## Features

- ✅ Full CRUD operations for Product entities
- ✅ PostgreSQL database integration
- ✅ Docker Compose setup for easy deployment
- ✅ Spring Data JPA for database operations
- ✅ RESTful API design

## Technology Stack

- **Java**: 25
- **Spring Boot**: 3.5.7
- **Spring Data JPA**: For database operations
- **PostgreSQL**: Database
- **Docker**: Containerization
- **Maven**: Build tool

## Project Structure

```
apirest/
├── src/
│   ├── main/
│   │   ├── java/com/apirest/apirest/
│   │   │   ├── ApirestApplication.java
│   │   │   ├── Controllers/
│   │   │   │   └── ProductController.java
│   │   │   ├── Entities/
│   │   │   │   └── Product.java
│   │   │   └── Repositories/
│   │   │       └── ProductRepository.java
│   │   └── resources/
│   │       └── application.properties
│   └── test/
├── docker-compose.yml
├── .env.template
└── pom.xml
```

## Getting Started

### Prerequisites

- Java 25 or higher
- Maven 3.x
- Docker and Docker Compose

### Installation

1. **Clone the repository**
   ```bash
   git clone git@github.com:irenemonzon/java-crud-api-rest.git
   ```

2. **Configure environment variables**
   
   Copy the `.env.template` file to `.env`:
   ```bash
   cp .env.template .env
   ```

   Edit the `.env` file with your database credentials:
   ```env
   SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/productdb
   SPRING_DATASOURCE_USERNAME=your_username
   SPRING_DATASOURCE_PASSWORD=your_password
   SPRING_DATASOURCE_DB=productdb
   ```

3. **Start PostgreSQL with Docker**
   ```bash
   docker compose up -d
   ```





The API will be available at `http://localhost:8080`

## API Endpoints

### Base URL
```
http://localhost:8080/products
```

### Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/products` | Get all products |
| GET | `/products/{id}` | Get product by ID |
| POST | `/products` | Create a new product |
| PUT | `/products/{id}` | Update a product |
| DELETE | `/products/{id}` | Delete a product |

### Example Requests

**Create a Product**
```bash
curl -X POST http://localhost:8080/products \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Laptop",
    "price": 999.99
  }'
```

**Get All Products**
```bash
curl http://localhost:8080/products
```

**Get Product by ID**
```bash
curl http://localhost:8080/products/1
```

**Update a Product**
```bash
curl -X PUT http://localhost:8080/products/1 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Gaming Laptop",
    "price": 1299.99
  }'
```

**Delete a Product**
```bash
curl -X DELETE http://localhost:8080/products/1
```

## Database Schema

### Product Table

| Column | Type | Constraints |
|--------|------|-------------|
| id | BIGINT | PRIMARY KEY, AUTO_INCREMENT |
| name | VARCHAR | - |
| price | DOUBLE | - |



## Configuration

The application configuration is managed through `application.properties`:

- **Server Port**: 8080
- **JPA**: Auto-update schema
- **Database**: PostgreSQL (configured via environment variables)

## Troubleshooting

### Database Connection Issues
- Ensure PostgreSQL is running: `docker-compose ps`
- Verify environment variables in `.env` file
- Check if port 5432 is available

### Port Already in Use
If port 8080 is already in use, modify `server.port` in `application.properties`

