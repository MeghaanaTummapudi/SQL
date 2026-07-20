class Solution:
    def shuffle(self, nums: List[int], n: int) -> List[int]:
        l1 = nums[n:]
        newt = []
        for i in range(n):
            newt.append(nums[i])
            newt.append(l1[i])
        
        return newt
    

