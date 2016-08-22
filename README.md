# README

This is an exercise building a RESTful API in Rails. It also includes, but not limited to Integration Tests, CRUD operations, and Rake Tasks to import data from a CSV file.

Within the application you will find an API built to accommodate version control and formatted to JSON. The use of a gem named "Active Model Serializers" helps with convention.

CRUD(Create, Read, Update, Destroy) operations were a main focal point of this exercise. You will also find that correct HTTP status codes coincide with the HTTP requests made in correlation to specific CRUD operations such as POST, GET, PUT, DELETE, and PATCH.

The data was imported from a CSV file by using a Rake Task. The code requires the CSV class in lib/tasks/import.rake file.

Tests were used in the spec/features/patient_appt_data_spec.rb file to ensure that the application could perform the desired functions.

When importing data from the CSV file there were over lapping appointments so the rake task was aborted. Because I wanted to import all data I allowed the application to permit already existing data to be imported even they overlapped.
