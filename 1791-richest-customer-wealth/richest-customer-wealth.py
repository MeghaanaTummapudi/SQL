class Solution:
    def maximumWealth(self, accounts: List[List[int]]) -> int:
        ind = 1
        tst = {}
        for i in accounts:
            tst[ind] = sum(i)
            ind = ind + 1
        max_val = max(tst.values())

        return max_val
       

            