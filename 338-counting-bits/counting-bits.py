class Solution:
    def countBits(self, n: int) -> List[int]:
        
        # ans = [None] * (n + 1)
        # tst = []
        # new_count = []
        
        # for i in range(n+1):
        #     bin_n = bin(i)[2:]
        #     tst.append(bin_n)

        
        # for x in tst:
        #     n_c = 0
        #     if x.count('1') != 0:
        #         n_c += x.count('1')
        #     new_count.append(n_c)
        # return new_count
        new_count = []
        tst = [bin(i)[2:] for i in range(n+1)]
        new_count += [x.count('1') for x in tst]
        return new_count
