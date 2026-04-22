class Solution:
    def isPalindrome(self, x: int) -> bool:
        # n = len(str(x))
        # str_x = str(x)
        # ls = []
        # for i in range(len(str_x)):
        #     if str_x[i] == str_x[n-i-1]:
        #         ls.append(1)
        #     else:
        #         ls.append(0)
        # if set(ls) == {1}:
        #     return True
        # return False

        # for i in range(len(str_x)):
        #     if str_x[i] != str_x[n-i-1]:
        #         return False
        # return True

        str_x = str(x)
        str2 = str_x[::-1]
        print(str2)
        if str_x == str2:
            return True
        return False        