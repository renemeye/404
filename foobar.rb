(1..404).each do |line_number|
	(line||="") << "Foo" if (line_number % 3).zero?
	(line||="") << "Bar" if (line_number % 5).zero?

	puts line || line_number
end

