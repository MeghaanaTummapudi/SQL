class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        tst = []
        rsum = 0
        for i in nums:
            rsum = rsum + i
            tst.append(rsum)
        return tst
        