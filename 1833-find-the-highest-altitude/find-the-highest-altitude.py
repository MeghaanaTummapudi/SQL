class Solution:
    def largestAltitude(self, gain: List[int]) -> int:
        
        tst = [0] * (len(gain) + 1)
        tot = 0
        for i in range(len(gain)):
            tot = tot + gain[i]
            tst[i + 1] = tot
        
        return max(tst)