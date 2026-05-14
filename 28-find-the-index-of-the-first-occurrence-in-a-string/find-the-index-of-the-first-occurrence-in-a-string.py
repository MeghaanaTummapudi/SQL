class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        
        len_n = len(needle)
        tst = []
        for i in range(0, len(haystack)):
            new = haystack[i:i+len_n]
            tst.append(new)

        for x in range(len(tst)):
            if tst[x] == needle:
                return x
        return -1

