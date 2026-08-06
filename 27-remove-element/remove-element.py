class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        
        nums[:] = [y for y in nums if y != val]
        print(nums)