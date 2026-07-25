class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        
        write = 1
        for i in range(len(nums) - 1):
            # print('i :', i) 
            j = i + 1
            # print('j :', j)
            if nums[i] != nums[j]:
                nums[write] = nums[j]
                # print('write :', write)
                write = write + 1
                
        nums[:] = nums[ : write]
        return len(nums)



            

