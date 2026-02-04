class Solution:
    def moveZeroes(self, nums: List[int]) -> None:

        # lenn = nums.count(0)
        # newt2 = []
        # test2 = [0] * lenn
        # for i in range(len(nums)):
        #     if nums[i] != 0:
        #         newt2.append(nums[i])
        # newt2.extend(test2)
        # print(newt2)

        tst = 0
        for i in range(len(nums)):
            if nums[i] != 0:
                nums[tst] = nums[i]
                tst = tst + 1
        print(tst)
        for i in range(tst, len(nums)):
            nums[i] = 0

        return nums

        






        