class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        running = []
        n = len(nums)
        running.insert(0, nums[0])
        # print(running)
        for i in range(1, len(nums)):
            running.insert(i, running[i - 1] + nums[i]) 
        # print(running)
        return running

