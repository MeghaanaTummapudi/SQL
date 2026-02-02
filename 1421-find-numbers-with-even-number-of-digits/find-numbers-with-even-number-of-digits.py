class Solution:
    def findNumbers(self, nums: List[int]) -> int:
        # # convert list of ints to list of strings
        # new_ls = []
        count = 0
        # for i in nums:
        #     new_ls.append(str(i))

        # for i in new_ls:
        #     n_c = len(i)
        #     if n_c % 2 == 0:
        #         new_c = new_c + 1

        # return new_c
        for i in nums:
            # new_ls.append(str(i))
            str_len = len(str(i))
            if str_len % 2 == 0:
                count += 1
        return count

