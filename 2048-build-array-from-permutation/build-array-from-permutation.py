class Solution:
    def buildArray(self, nums: List[int]) -> List[int]:
        # newt = 0
        # ans = []
        # for i in range(len(nums)):
        #     newt = nums[nums[i]]
        #     ans.append(newt)
        # return ans

        ans = []
        for i in range(len(nums)):
            ans.append(nums[nums[i]])
        return ans
