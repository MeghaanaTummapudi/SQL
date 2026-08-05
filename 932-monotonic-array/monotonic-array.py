def increasing(nums):
    for i in range(len(nums) - 1):
        j = i + 1
        if nums[i] > nums[j]:
            return False
    return True

def decreasing(nums):
    for i in range(len(nums) - 1):
        j = i + 1
        if nums[i] < nums[j]:
            return False
    return True


class Solution:
    def isMonotonic(self, nums: List[int]) -> bool:
        return increasing(nums) or decreasing(nums)
        
       
 
    

            