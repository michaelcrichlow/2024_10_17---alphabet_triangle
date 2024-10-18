package test

import "core:fmt"
import "core:strings"
print :: fmt.println

main :: proc() {

	alphabet_triangle("F", context.temp_allocator)
	free_all(context.temp_allocator)
	// OUTPUT:
	//      A     
	//     ABA    
	//    ABCBA   
	//   ABCDCBA  
	//  ABCDEDCBA 
	// ABCDEFEDCBA
}

alphabet_triangle :: proc(letter: string, allocator := context.allocator) {
	alphabet_string := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	test_letter := strings.to_upper(letter)
	defer delete(test_letter)

	index := strings.index(alphabet_string, test_letter)
	sub_string := alphabet_string[:index + 1]
	length := (len(sub_string) * 2) - 1

	for i in 1 ..< len(sub_string) + 1 {
		part_one := sub_string[:i]
		part_two := strings.reverse(sub_string[:i - 1])
		defer delete(part_two)

		final_string := concatenate_two_strings(part_one, part_two, allocator)

		print(strings.center_justify(final_string, length, " ", context.temp_allocator))
	}
}
