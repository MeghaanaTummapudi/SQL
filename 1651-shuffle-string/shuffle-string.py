class Solution:
    def restoreString(self, s: str, indices: List[int]) -> str:
        
        tst = [None] * len(s)
        for i in range(len(s)):
            x = indices[i]
            tst[x] = s[i]

        new_str = "".join(tst)
        return new_str