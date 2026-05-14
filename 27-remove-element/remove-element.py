class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        
        # tst = []
        # for i in range(len(nums)):
        #     if nums[i] == val:
        #         tst.append(i) 

        # del nums[tst]
        # print(nums)

        nums[:] = [x for x in nums if x != val]
        return len(nums)
