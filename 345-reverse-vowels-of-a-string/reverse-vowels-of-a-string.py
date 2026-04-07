class Solution:
    def reverseVowels(self, s: str) -> str:
        vow = ['a', 'e', 'i', 'o', 'u']
        nw = []
        iw = []
        for i,v in enumerate(s):
            if v.lower() in vow:
                nw.append(v)
                iw.append(i)

        rev = nw[::-1]

        ls = list(s)
        for i in range(len(iw)):
            ls[iw[i]] = rev[i]

        testing = ''.join(ls)
        return ''.join(ls)

