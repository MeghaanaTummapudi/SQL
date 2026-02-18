class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        # time limit exceeded error
        # for i in range(len(nums)):
        #     for j in range(1, len(nums)):
        #         if nums[i] == nums[j] and i != j:
        #             return True
        # return False

    # scan the entire list once, if havent seen the element then add once to the set and easy comparision -  O(n) - even if every element is unique
        seen = set()
        for i in nums:
            if i in seen:
                return True
            
            seen.add(i)
        return False
        