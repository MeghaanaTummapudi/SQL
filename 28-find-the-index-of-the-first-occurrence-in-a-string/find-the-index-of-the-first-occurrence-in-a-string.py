class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        
        # len_n = len(needle)
        # tst = []
        # for i in range(0, len(haystack)):
        #     new = haystack[i:i+len_n]
        #     tst.append(new)

        # for x in range(len(tst)):
        #     if tst[x] == needle:
        #         return x
        # return -1

        new = [haystack[i: i+len(needle)] for i in range(len(haystack))]
        
        for i in range(len(new)):
            if new[i] == needle:
                return i
        return -1
