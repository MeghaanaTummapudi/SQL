class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        tsting = []
        m = len(word1)
        n = len(word2)
        for i, j in zip(word1, word2):
            tsting.append(i)
            tsting.append(j)
        
        if m > n:
            tsting.append(word1[n:])
        
        if n > m:
            tsting.append(word2[m:])

        res = ''.join(tsting)
        return (res)
        
