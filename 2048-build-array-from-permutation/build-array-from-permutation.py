class Solution:
    def buildArray(self, nums: List[int]) -> List[int]:

        # ls = [None] * len(nums)  
        # for i in range(len(nums)):
        #     ls[i] = (nums[nums[i]])

        # return ls


        ans = [nums[nums[i]] for i in range(len(nums))]
        return ans

        
        