    ¿##Hireology Software Engineer Homework

### Instructions

There are two parts to the Software Engineer Homework set. Part 1 is written answer, and Part 2 is a set of programmable problems. Please fork this repo to your GitHub account, add your work to the forked repo, and send a pull request when your work is complete.

###Part 1 - Written Questions

####1. How can Memcache improve a site’s performance? Include a description about how data is stored and retrieved in a multi-node configuration.

* Memcached retains data in memory avoiding slow disk access. You can store frequently accessed chunks of data, page partials, etc in memory, avoiding the cost of going out to disk or across the network to a database for each request.

* A multi-node configuration uses a two tiered/bucket hash system with the first tier locating the server node by hashing a key using a strategy determine by the client library (gem). Once the server node is determined a call is made to that memcached server (which can be on the same machine, or wherever memory is available in the server cluster). Memcached looks up the value in a traditional in memory hash and returns the corresponding data if present. If a key can be present on multiple servers those servers can be contacted and conduct a search simultaneously.


####2. Please take a look at [this controller action](https://github.com/Hireology/homework/blob/master/some_controller.rb). Please tell us what you think of this code and how you would make it better.

* What I think of the code is that it looks like it was developed under pressure with creeping features, by someone who wasn't paying a lot of attention to MVC. It needs some serious love and refactoring.

* Write unit tests verifying the controller behavior first, if they don't exist. That will guide the refactoring and make sure that simple logic errors or types don't break things that worked before.

* Most of this controller code belongs in the model. 

* Overall there are too many very long lines which should solved by named/nested active record scopes and extracting methods.

* The method is far too long and does too much.

* Comments that reflect historical code changes should be trusted to git. Code and method names should be chosen to be self documenting to the extent possible. 

* s_key is badly named as are some other locals throughout.

* Unnecessary semicolon after first line of controller.

* Unnecessary double quoting is used throughout the file. 

* The `if/elsif` section could be replaced with a case and is suspiciously repeated in code below. I would look at removing that redundancy, pull the strings out and use constants or symbols instead, and change the view to submit the sort type using those constants. In this case the strings are repeated in 3 places, which makes keeping them in sync a problem. It's also very fragile. Even an extra space would make the call behave unexpectedly. 

* We're bringing back the same list of candidates in each case. Using scopes or a function on the organization would save having to pass the is_deleted and is_completed parameters over and over again. 

* use ```if ! found``` instead of ```if found == false```

* ``‘unless candidate_jobs.blank?``’  looks to be redundant. The each would handle it.

* The multi-unless section is a haystack. Again I would create methods in the model to handle the indvidual cases and have one clean call in the controller.

* The render could be simplified with defaults and naming conventions. 
* There is more, but after applying these changes the code would be very different. I'd want to get a look at that result before proceeding further. 

###Part 2 - Programming Problems

1) Write a program using regular expressions to parse a file where each line is of the following format:

```$4.99 TXT MESSAGING – 250 09/29 – 10/28 4.99```

For each line in the input file, the program should output three pieces of information parsed from the line in the following JSON format (using the above example line):

```
{
  “feature” : “TXT MESSAGING – 250”,
  “date_range” : “09/29 – 10/28”,
  “price” : 4.99 // use the last dollar amount in the line
}
```
* see jsonify.rb

2) Please complete a set of classes for the problem described in [this blog post](http://www.adomokos.com/2012/10/the-organizations-users-roles-kata.html). Please do not create a database backend for this. Test doubles should work fine.
