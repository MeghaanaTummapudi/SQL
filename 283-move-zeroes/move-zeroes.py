class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        
        tst = 0

        for i in range(len(nums)):
            if nums[i] != 0:
                nums[tst] = nums[i]
                tst = tst + 1
        # print(tst)

        nums[tst:] = [0] * (len(nums) - tst)

        print(nums)



            
                
                    
    

