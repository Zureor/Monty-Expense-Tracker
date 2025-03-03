# Monty-Expense-Tracker
A simple finance tracking application built using Java, Spring Web, and MySQL.

## Features
- Add, edit, and delete financial transactions
- Categorize expenses and income
- View transaction history

## Prerequisites
Before running the project, ensure you have the following installed:
- Java 21 or later
- Spring Boot
- MySQL
- Maven
- Git

## Setup Instructions

### 1. Clone the Repository
```sh
git clone https://github.com/Zureor/Monty-Expense-Tracker
cd expense_tracker
```

### 2. Configure Database
Create a MySQL database and update the `application.properties` file with your database credentials:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/expense_tracker
spring.datasource.username=root
spring.datasource.password=root
spring.jpa.hibernate.ddl-auto=update
```

### 3. Build and Run the Application
Use Maven to build and run the project:
```sh
mvn clean install
mvn spring-boot:run
```

### 4. Access the Application
Once the application is running, open your browser and visit:
```
http://localhost:8080
```


## Contributing
Feel free to fork the repository and submit pull requests for improvements.

## License
This project is licensed under the MIT License.

## Contact
For any queries, open an issue on GitHub.

