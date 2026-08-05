class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        
        # tst = list(set(nums))
        # print(tst)

        # if len(tst) <= 2:
        #     return max(tst)

        # else:
        #     tst1 = sorted(tst, reverse = True)
        #     return tst1[2]

        first = None
        second = None
        third = None

        for y in nums:

            if first == y or second == y or third == y:
                continue
            if first is None or y > first:

                third = second
                second = first
                first = y

            elif second is None or y > second:
                third = second
                second = y

            elif third is None or y > third:
                third = y

        if third is None:
            return first
        return third

                