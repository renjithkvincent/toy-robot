# Solution
  
Run rspec unit tests:
-----------
  
```
cd toy-robot
  
gem install bundler -v 2.1.4
  
bundle install --path .bundle
  
bundle exec rspec
      
```

Run the example:
-----------
```
cd toy_robot

ruby run_robot/run_robot.rb

```

Input file location
--------
data/command_list.txt

The code
-----------
The code reads an input file in .txt format in the folder 'data'. Each instruction is on a new line.
The file run_robot.rb reads the input file and starts the execution of the robot program.

The following are the parts of the robot program:

**CommandParser**: Parses the text file, iterates through each line, executes the valid commands

**ActionInterpreter**  Interprets the right action from the text input and calls the action in the action organizer

**ActionOrganizer** Organises the right action(MOVE, LEFT, PLACE, etc) call

**Coordinates** Is a Module, not a Class(hello, Singleton) since this one doesn't have a state. It has methods
to get the x, y steps(on move action) and the new direction on turning left/right

**Robot** The actual robot lives here. Has a state - current_position(the source of truth). Has methods to 1)check if 
the robot has a valid position, 2)to update the current position if the input is a valid position

**Table**  This class defines the table on which the robot moves around. The size of the table is set here. It contains
a check to see if a position is within the limits of the table

**Position** Position(x and y coordinates, direction) of the robot is instantiated here. The moves and turns take place
here. The methods return a new position. The robot is not yet updated. Also has the potential to return a position
outside the table, pushing the robot off the table, on to the ground. The Robot has the smarts to stop that in 
Robot#safe_update_position
