class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        
        new = s.split()
        fin = new[-1]
        return len(fin)