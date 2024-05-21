# class Solution:
#     def twoSum(self, nums: List[int], target: int) -> List[int]:
#         for i in range(len(nums)):
#             for j in range(i):
#                 if nums[i] + nums[j] == target:
#                     return i, j
        

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:    
        testing = {}

        for i, num in enumerate(nums):
            comp = target - num

            if comp in testing:
                #print(testing)
                return[testing[comp], i]
            # print(testing)
            testing[num] = i