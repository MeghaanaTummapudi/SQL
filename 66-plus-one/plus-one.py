class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        
        ls = ""
        for i in range(len(digits)):
            ls = ls + str(digits[i])

        # print(ls)
        new = str(int(ls) + 1)
        tsts = []
        for i in range(len(new)):
            tsts.append(int(new[i]))
        return tsts
        
