class Solution:
    def getConcatenation(self, nums: List[int]) -> List[int]:
        
        # ans = nums + nums
        # return ans
        n = len(nums)
        ans = [None] * 2 * n
        for i in range(len(nums)):
            ans[i] = nums[i]
            ans[i+n] = nums[i]
        return ans