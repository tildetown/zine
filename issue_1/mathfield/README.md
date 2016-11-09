# Mathfield (Python)
This is a program to make a grid of your design by using a function.
## How to use
```Python
import mathfield, math;
def xplusyiseven(x,y):
	return (x+y)/2 == math.floor((x+y)/2)

field = mathfield.Mathfield(xplusyiseven,8,8)
field.draw_field("X","O")
"""Draws the field using the specified on and off chars. Usage: draw_field(onchar,offchar) where onchar is the character for passing combinations, and offchar is the character for failing combinations."""
field.test_case(1,2)
"""Shows what the stored function would return for a x/y combination."""
```
