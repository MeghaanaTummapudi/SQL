class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        
        tst = list(set(nums))
        print(tst)

        if len(tst) <= 2:
            return max(tst)

        else:
            tst1 = sorted(tst, reverse = True)
            return tst1[2]