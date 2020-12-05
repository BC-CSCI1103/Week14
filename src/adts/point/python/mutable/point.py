# file: point.py
# author: Bob Muller
# date: April 29, 2013

# This file contains code and commentary on the important
# issue of defining types, or data abstraction in Python. 

# The central mechanism for organizing computation in programming
# languages is the function. (Functions that don't return results are
# often called -procedures- and functions that are defined within
# classes (see below), are often called -methods-).  Programming
# languages provide sets of so-called "built-in" functions as well as
# ways to define new functions. Since our first meeting, we've worked
# with -procedural abstraction-.  E.g., when we need to compute the
# area of a circle, say, of radius 5:
#
# >>> math.pi * 5.0 ** 2.0
#
# or of radius 10:
#
# >>> math.pi * 10.0 ** 2.0
#
# Procedural abstraction tells us that we should create an
# abstraction of these computations. In particular, we should 
# -name- it (in this case area) and we should replace the 
# varying radius with a variable (in this case radius), giving:
#
def area(radius);
    return math.pi * radius ** 2.0
#
# Defining New Types
#
# Another fundamental activity in software development is defining 
# new -types-.  A new type, roughly speaking, is a name for the type
# together with a set of operations or functions that work on values
# of the new type. Different programming languages will provide
# different ways to define new types. Python has limited facilities
# for defining new types. Python supports new type definitions 
# using the so-called "object-oriented" style. The issues will be 
# illustrated using a new type for points in the Cartesian plane.
#
# A simple Point class.
#
import math

class Point():
  """This is a help string for the new Point type."""
    
# The constructor of Points.
#
  def __init__(self, x=0.0, y=0.0):
    self.x = x                       # These are instance
    self.y = y                       # variables

  def __str__(self):
    return "(" + str(self.x) + ", " + str(self.y) + ")"

# Getters.
#
  def getX(self): return self.x
  def getY(self): return self.y

# Compute the distance from self to the origin.
#
  def distance(self):
    return math.sqrt(self.getX() ** 2.0 + self.getY() ** 2.0)

# eq : Point -> bool
#
# The call point.eq(other) returns True iff self and other denote
# the exact same Point.
#
  def eq(self, other):
    return self == other

#
# compareTo : Point -> int
#
# The call point.compareTo(other) returns a negative number if
# self is less than other and a positive number if self is greater
# than other. Otherwise it returns 0.
#
# NB: there are many ways to compare points. Three versions here:
# 1. distance from 0
# 2. compare just the x components
# 3. lexicographical
#

# compare based on distance from the origin. This equates points
# in rings around the origin.
#
  def compareTo(self, other):
    return self.distance() - other.distance()

# compare by only x-coordinate. This equates points all points on
# a vertical line.
#
  def compareTo(self, other):
    return self.getX() - other.getX()

# compare lexicographically: first by x, then by y.  Two points
# on the same vertical line are related by their distances from
# the x-axis.
#
  def compareTo(self, other):
    dx = self.getX() - other.getX()
    return dx if dx != 0 else self.getY() - other.getY()
  
# equal : Point -> bool
#
# The call point.equal(other) returns True iff point.compareTo(other)
# returns 0. So this definition of equal is "consistent with compareTo" 
# in the Java sense.
#
  def equal(self, other):

    return self.compareTo(other) == 0

# Mutability -- once we add the following setters, our implementation
# of points is mutable!!!!
#

# setX : float -> void
#
  def setX(self, x):
    self.x = x

# setY : float -> void
#
  def setY(self, y):
    self.y = y

# A version of a move function for MUTABLE Points.

# move : float * float -> void
#
  def move(self, dx, dy):
    self.setX(self.getX() + dx)
    self.setY(self.setY() + dy)

# Immutability
#
# First get rid of the setters.(!!) Now define move as follows:

# move : float * float -> Point
#
  def move(self, dx, dy):
    return Point(self.getX() + dx, self.getY() + dy)
  
# Limitations of Python's ability to define new types.
#
# 1. As far as software engineering goes, it is best if new types are
#    ABSTRACT. These are the so-called abstract data types (ADTs)
#    mentioned earlier.
#
#    There is the new type, e.g., Point, and then there are the
#    concrete -representation types- that are vital to the
#    implementation of the new type. In the Point example above, the
#    variables self.x and self.y hold the floating point values of the
#    x and y coordinates of the point.
#
#    When an ADT is created, only the new type and the operations are
#    usable. The representation types (and support functions) should
#    be HIDDEN. For example, the 'client' of the ADT should not be
#    able to do this:
#
#    p = Point(2, 3)           
#    p.x = 92                THIS IS BAD!
#    p.setX(92)              THIS IS BETTER.
#
#    Here, Python leaves the representation variable self.x exposed to
#    the client. This is bad because
#
#      1. it isn't modular and 
#
#      2. once clients starting accessing the internals, the owner 
#         of the ADT cannot change anything.
#
# 2. An ADT should have a well-defined -application programmer
#    interface- (or API). An API names the newly introduced type 
#    and specifies the names and types of the available operations.
#
#    In many programming languages (e.g., Java, C#, ML) APIs are part
#    of the program and the language is designed in such a way that
#    the language implementation (i.e., the compiler) can check to
#    confirm that an implementation of the new type (in Python this
#    would be the class definition) actually implements the specified
#    API.
#
#    Python doesn't support APIs.
