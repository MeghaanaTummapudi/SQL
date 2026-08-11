class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        
        # nums[:] = [y for y in nums if y != val]
        # print(nums)

        j = len(nums) - 1
        i = 0
    
        k = sum(1 for x in nums if x == val)
        while i < j :
            # print(i, j)
            if nums[i] == val:
                if nums[j] != val:
                    nums[i], nums[j] = nums[j], nums[i]
                    i = i + 1
                    j = j - 1
                else:
                    j = j - 1
            
            else:
                i = i + 1
        return (len(nums) - k)

        
    
            
