typedef struct {
	string name;
	string course;
	int duration;
} student_t; //defining a data type by name 'student_t'

- student_t student_detailsQ[$];
	//Here student_t is data type and student_detailsQ is the data variable. 

struct
------
- 'struct' is a static data type. It keeps different data types as a single entity.
- It does not have task, functions, and constraints.
- It will be quick with simulation.

CLASS
-----
Class also do the same thing as struct.
	- It groups different data variables into single entity.
	- Class is a dynamic data type.
	- If our requirement is to have some constraints and some task/functions operating on
	  those data variables, then we use class.
	  
	  