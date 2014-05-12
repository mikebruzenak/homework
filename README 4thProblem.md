    ¿##Hireology Software Engineer Homework



2) Please complete a set of classes for the problem described in [this blog post](http://www.adomokos.com/2012/10/the-organizations-users-roles-kata.html). Please do not create a database backend for this. Test doubles should work fine.

* There is no API specified so I assumed we want to know what role a user has for a particular organization. 

* Other possibilites that I did not code are to list all organizations that the user has a role for. In this case in the RoleOrganizer we would iterate thorugh the roles for user hash and then recursively find all children with a join on Organization then add the roles to a hash unless denied. I overkilled this thing enough so I left that to an update.

* I use a stubDb and an ActiveRecord-like model stub so this soultion should drop right into ActiveRecord. The StubDB may be unconventional but it allows great clarity and easy modifications to the test data and results. 

* DB access is minimal. To find the role for a user the depth of the organizations is the number of searches required. Or less. For listing all organizations the sparse user permission table directs the access to only what matters. 

