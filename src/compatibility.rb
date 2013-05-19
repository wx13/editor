#---------------------------------------------------------------------
# Compatibility code.
#
# Backports of some string and array functionality to help
# with old versions of ruby.
#---------------------------------------------------------------------

if RUBY_VERSION < "1.8.7"
class String
	def partition(pattern)
		a,b = self.split(pattern,2)
		c = self.scan(pattern)[0]
		c = "" if c.nil?
		b = "" if b.nil?
		a = "" if a.nil?
		return a, c, b
	end
	def rpartition(pattern)
		x = self.split(pattern)
		b = x[-1]
		a = x[0..-2].join
		c = self.scan(pattern)[-1]
		c = "" if c.nil?
		b = "" if b.nil?
		a = "" if a.nil?
		return a, c, b
	end
	def each_char
		self.each_byte{|b| yield b.chr}
	end
end
class Array
	alias_method :slice_orig!, :slice!
	def slice!(*args)
		self.slice_orig!(*args)
		self.delete_if{|x|x.nil?}
	end
end
end

# end of compatibility code
#---------------------------------------------------------------------
