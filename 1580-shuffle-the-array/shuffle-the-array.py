class Solution:
    def shuffle(self, nums: List[int], n: int) -> List[int]:
        tst = nums[n:]
        newt = []
        for i in range(n):
            newt.append(nums[i])
            newt.append(tst[i])
        return newt