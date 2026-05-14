class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        
        # new = s.split()
        # fin = new[-1]
        # return len(fin)

        new = s.split()
        return len(new[len(new) - 1])
        