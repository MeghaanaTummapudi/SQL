class Solution:
    def reverseWords(self, s: str) -> str:
        
        new = s.split(" ")
        ls = []

        for i in range(len(new)):
            tst = new[i][::-1]
            ls.append(tst)
            
        return " ".join(ls)
            

        