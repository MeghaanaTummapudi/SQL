class Solution:
    def countBits(self, n: int) -> List[int]:
        
        ans = [None] * (n + 1)
        tst = []
        new_count = []
        
        for i in range(n+1):
            # print(i)
            bin_n = bin(i)[2:]
            # print(bin_n)
            tst.append(bin_n)
        # print(tst)
        
        for x in tst:
            n_c = 0
            if x.count('1') != 0:
                n_c += x.count('1')
            new_count.append(n_c)
        return new_count
        
            
