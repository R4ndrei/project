# Boards API - A Trello-like Project

This project is a Ruby on Rails web application that provides functionalities similar to those of the Trello platform. It allows users to create and manage boards, columns, and stories.

Features
CRUD Operations: Users can create, read, update, and delete boards, columns, and stories.
Ordering: Columns and stories can be rearranged in an intuitive manner.

Technologies Used
-Ruby on Rails
-SQLite (for development) / PostgreSQL (for production)
-HTML/CSS (for simplified frontend elements)

How to Run the Project

Ensure you have Ruby, Rails, and SQLite installed on your system. For more details, refer to the official Ruby on Rails documentation.

Cloning the Repository

git clone https://github.com/R4ndrei/project.git

cd project

Setting Up the Application
Install the necessary dependencies:

bundle install

Set up the database:

rails db:create db:migrate

Starting the Local Server
You can start the local server using:

rails server

After the server is up, visit http://localhost:3000 in your browser to view the application.
