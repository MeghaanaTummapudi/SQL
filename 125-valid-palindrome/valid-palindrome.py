class Solution:
    def isPalindrome(self, s: str) -> bool:
        # new = s.split(" ")
        ls = []
        for i in s:
            if i.lower().isalnum():
                ls.append(i.lower())
        
        new = "".join(ls)
        rev = new[:: -1]

        if new == rev:
            return True
        return False