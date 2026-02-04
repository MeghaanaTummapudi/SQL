class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        newt = ''
        new_list = []
        for i in range(len(digits)):
            newt += str(digits[i])
        # print(newt)
        new_int = str(int(newt) + 1)
        for char in new_int:
            n_char = int(char)
            new_list.append(n_char)
        return new_list



