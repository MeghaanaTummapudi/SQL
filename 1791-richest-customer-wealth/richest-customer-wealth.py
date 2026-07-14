# added individual lists and added these values and used an index to store to dictionary and got the max value from there
class Solution:
    def maximumWealth(self, accounts: List[List[int]]) -> int:
        # ind = 1
        # tst = {}

        # for i in accounts:
        #     tst[ind] = sum(i)
        #     ind = ind + 1
        # max_val = max(tst.values())

        # return max_val
        ind = 0
        tst = {}
        for i in accounts:
            tst[ind] = sum(i)
            ind = ind + 1
        # print(tst)
        return max(tst.values())



            