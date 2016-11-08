import sys;

class Mathfield:
	"""A mathematical field."""
	def __init__(self, f, sx, sy):
		self.func = f;
		self.xsize = sx;
		self.ysize = sy;

	def draw_field(self, onchar, offchar):
		"""Draw the field using the supplied on and off characters."""
		for y in range(1,self.ysize):
			for x in range(1,self.xsize):
				if self.func(float(x),float(y)):
					sys.stdout.write(onchar);
				else:
					sys.stdout.write(offchar);
			sys.stdout.write("\n");

	def test_case(x,y):
		return self.func(float(x),float(y));
