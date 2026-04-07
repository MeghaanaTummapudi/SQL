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
        # print(rev)
        # print(iw)
        ls = list(s)
        # print(ls)
        for i in range(len(iw)):
            ls[iw[i]] = rev[i]
        # print(ls)
        testing = ''.join(ls)
        return testing

