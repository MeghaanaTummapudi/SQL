class Solution:
    def reverseWords(self, s: str) -> str:
        t = s
        new = t.split(' ')
        test = []
        # print(new)
        
        for i in range(len(new)):
            # print(new[i])
            l = 0 
            r = len(new[i]) - 1
            # print(l, r)
            tst = list(new[i])
            # print(tst)
            while l < r:
                tst[l], tst[r] = tst[r], tst[l]
                l = l+1
                r = r-1
            # fin = ''.join(tst)
            # print(fin)
            final = ''.join(tst)
            # print(final)
            test.append(final)
            fin = ' '.join(test)
        return (fin)

            
            
