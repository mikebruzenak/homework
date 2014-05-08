##Hireology Software Engineer Homework

### Instructions

There are two parts to the Software Engineer Homework set. Part 1 is written answer, and Part 2 is a set of programmable problems. Please fork this repo to your GitHub account, add your work to the forked repo, and send a pull request when your work is complete.

###Part 1 - Written Questions

####1. How can Memcache improve a site’s performance? Include a description about how data is stored and retrieved in a multi-node configuration.

Memcached retains data in memory thus avoiding redundant disk access. What stays in memory and for how long is either by an automatic LRU strategy or one of many manual strategies.

A multi-node configuration uses a two tiered/bucket hash system with the first tier locating the server node. 


####2. Please take a look at [this controller action](https://github.com/Hireology/homework/blob/master/some_controller.rb). Please tell us what you think of this code and how you would make it better.

The code looks like it was developed under pressure with creeping features.

Most of this controller code belongs in the model. 

Overall there are too many very long lines and that indicates a problem solved by named/nested scopes and refactoring to methods.

The method is far too long and does too much.

Commented code should be trusted to git. I like to keep my paranoid txt file handy for dumping things_that_might_be useful_but_now_now. I seldom actually use them but it seems to make me feel better.

s_key is badly named as are some other locals throughout.

The sort options should be relegated to routing and multiple controller actions. Though it is difficult to be sure of why it was done with parameters instead. There could be a reason.

Unnecessary semicolon after first line of controller.

Unnecessary double quoting is used throughout the file. 

The if/elsif section could be replaced with a case and is suspiciously repeated in code below. I would look for a better solution involving a singleton class where the string constants were in one place. I would use symbols to represent the sort types on the outside. There is a choice to load all of the data and sort in memory that could have reasons and if this is the case the class that handled sort complexity would also handle the sorts. If not the case then scopes and queries can handle it.

use ‘if ! found’ instead of ‘if found == false’

‘unless candidate_jobs.blank?’  looks to be redundant. The each would handle it.

The multi-unless section is a haystack. Again I would create methods in the model to handle the indvidual cases and have one clean call in the controller.

The render could be simplified with defaults and naming conventions. 

There is more but I always like to see the big picture before deciding on a refactor route. 

###Part 2 - Programming Problems

1) Write a program using regular expressions to parse a file where each line is of the following format:

`$4.99 TXT MESSAGING – 250 09/29 – 10/28 4.99`

For each line in the input file, the program should output three pieces of information parsed from the line in the following JSON format (using the above example line):

```
{
  “feature” : “TXT MESSAGING – 250”,
  “date_range” : “09/29 – 10/28”,
  “price” : 4.99 // use the last dollar amount in the line
}
```

2) Please complete a set of classes for the problem described in [this blog post](http://www.adomokos.com/2012/10/the-organizations-users-roles-kata.html). Please do not create a database backend for this. Test doubles should work fine.
