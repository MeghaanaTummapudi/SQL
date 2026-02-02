class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        max_c = max(candies)
        # ans = []

        # for i in range(len(candies)):
        #     if extraCandies + candies[i] >= max_c:
        #         ans.append(True)
        #     else:
        #         ans.append(False)
        # return ans
        
        newt = [ True if extraCandies + candies[i] >= max_c else False for i in range(len(candies)) ]
        return newt