class Solution:
    def buildArray(self, nums: List[int]) -> List[int]:

        ls = [None] * len(nums)  
        # print(ls)
        for i in range(len(nums)):
            ls[i] = (nums[nums[i]])

        return ls

        
        