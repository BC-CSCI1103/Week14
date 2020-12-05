# file: line.py
# author: Bob Muller
# date: November 12, 2012
# revised: By Bob Muller, April 28, 2013

# A simple line class.
#
import math
from point import *

class Line():

  # Constructor
  #
  def __init__(self, p1, p2):
    self.p1 = p1
    self.p2 = p2

  # toString
  #
  def __str__(self):
    return "{p1 = " + str(self.p1) + ", p2 = " + str(self.p2) + "}"

  def getP1(self): return self.p1
  def getP2(self): return self.p2
  
  def length(self):
    rise = abs(self.getP1().getY() - self.getP2().getY())
    run  = abs(self.getP1().getX() - self.getP2().getX())
    
    return math.sqrt(rise ** 2 + run ** 2)

  def move(self, dx, dy):
    return Line(self.getP1().move(dx, dy), self.getP2().move(dx, dy))


def testLine():
  p1 = Point(0, 0)
  p2 = Point(5, 5)
  line = Line(p1, p2)

  print 'line = ' + str(line) + ', length = ' + str(line.length())
