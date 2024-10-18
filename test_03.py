def alphabet_triangle(letter: str) -> None:
    alphabet_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    sub_string = alphabet_string[:alphabet_string.index(letter.upper()) + 1]
    length = (len(sub_string) * 2) - 1

    for i in range(1, len(sub_string) + 1):
        part_one = sub_string[:i]
        part_two = sub_string[:i - 1][::-1]
        print((part_one + part_two).center(length))


def main() -> None:
    alphabet_triangle("F")
    # OUTPUT:
    #      A
    #     ABA
    #    ABCBA
    #   ABCDCBA
    #  ABCDEDCBA
    # ABCDEFEDCBA


if __name__ == '__main__':
    main()
