class Solution:
    def isPalindrome(self, x: int) -> bool:
        x_str = str(x)
        len_x = len(x_str)

        for i in range(len_x):
            if x_str[i] != x_str[(len_x- 1) - i]:
                return False

        return True
            