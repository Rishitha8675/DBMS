# Conceptual design - (Entity relation diagram)
## Entity
Entity is anything that exists in reallife  
Ex: Student , faculty , department  
* Roll.no is not an entity  
### single valued attribute
ex: name , D0B , because a student can have only one name  
### multi valued attribute
ex: Phone number  because a student can have many phone numbers  
### composite attribute  
ex:address becuase address itself can be divided into multiple parts , like door_no: ,street, town etc..  
### derived attribute  
ex: age , because it can be calculated from DOB i.e any attribute that can be calculated or derived from another attribute  
* primary key must be underlined
## Relationship
Advisor ,it is the relationship between two tables -> represented by a diamond shape  
* In ER diagram , irrespective of the relationships between the tables , write the attributes belong to that entity only in the entity table.  
  We can mention the relationships using adivisors.  

* descriptive attribute
There are 4 types of relationships  
  * one to one (one student can be mentored by one faculty and viceversa)
  * one to many(one student can be have multiple faculty mentors but each faculty mentor can guide only one student)  
  * many to one  
  * many to many(one student can have multiple faculty mentors and a faculty can guide multiple students)  

=(double lines btwn advisor and entity) , <->(one to one) , -> (one to many) , <- (many to one)  
= every student must have a mentor 
= every faculty must mentor a student  

