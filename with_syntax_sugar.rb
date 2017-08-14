def replace_the_numbers_in(numbers, conditinal_replacements)
	numbers.to_a.map do |number|
		words = conditinal_replacements.map do |replacement|
			word = replacement[:with]

			match = Array.wrap(replacement[:if]).reduce true do |all_matched, condition|
				condition = condition.clone()
				target_value = condition.delete(:is)

				condition.reduce true do |all_matched, (operator, operand)|
					number.send(operator, operand) == target_value
				end
			end

			match ? word : nil
		end
		(words.join == "") ? number : words.join
	end
end

class Array
	def and_print_them_line_by_line
		self.map { |line| puts line  }
	end

	def self.wrap(object)
		[object].flatten(1)
	end
end


replace_the_numbers_in(1..404, [
	{ with: "Foo", if: {modulo: 3, is: 0 }},
	{ with: "Bar", if: {modulo: 5, is: 0 }},
	{ with: "ROFL", if: {:== => 42, is: true }}
]).and_print_them_line_by_line()
