# ---- Build Stage ----
FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

# Copy project files
COPY . .

# Make Maven wrapper executable
RUN chmod +x mvnw

# Build the project
RUN ./mvnw clean package -DskipTests

# Rename jar file
RUN mv target/*.jar app.jar

# ---- Run Stage ----
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/app.jar .

# Environment variables
ARG PORT=8080
ENV PORT=${PORT}

# Create non-root user
RUN useradd runtime
USER runtime

# Expose port 
EXPOSE 8080

# Run the app
ENTRYPOINT sh -c "java -Dserver.port=${PORT} -jar app.jar"
