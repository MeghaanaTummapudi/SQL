class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        max_c = max(candies)
        # print(max_c)
        ans = []
        for i in range(len(candies)):
            # print('calc ', extraCandies + candies[i])
            # print(extraCandies)
            # print(candies[i])
            if extraCandies + candies[i] >= max_c:
                ans.append(True)
            else:
                ans.append(False)
        return ans