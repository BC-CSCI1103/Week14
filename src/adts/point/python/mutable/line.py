# file: line.py
# author: Bob Muller
# date: November 12, 2012
# revised: By Bob Muller, April 28, 2013

# A simple line class.
#
import Tkinter
import math
from point import *

class Line():
  
  def __init__(self, p1, p2):
    self.p1 = p1
    self.p2 = p2

  def __str__(self):
    return "{p1 = " + str(self.p1) + ", p2 = " + str(self.p2) + "}"

  def length(self):
    rise = abs(self.p1.getY() - self.p2.getY())
    run = abs(self.p1.getX() - self.p2.getX())
    
    return math.sqrt(rise ** 2 + run ** 2)
      

def testLine():
  p1 = Point(0, 0)
  p2 = Point(5, 5)
  line = Line(p1, p2)

  print 'line = ' + str(line) + ', length = ' + str(line.length())
