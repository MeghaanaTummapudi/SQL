class Solution:
    def isMonotonic(self, nums: List[int]) -> bool:
        return self.increasing(nums) or self.decreasing(nums)
        
    def increasing(self, nums):
        tst = []
        for i in range(len(nums) - 1):
            j = i + 1
            if nums[i] <= nums[j]:
                tst.append(True)

            else:
                tst.append(False)

        # print(tst)
        res = all(tst)
        return res

    def decreasing(self, nums):
        tst = []
        for i in range(len(nums) - 1):
            j = i + 1
            if nums[i] >= nums[j]:
                tst.append(True)

            else:
                tst.append(False)

        # print(tst)
        res = all(tst)
        return res

    

            