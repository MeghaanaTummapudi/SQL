# class Solution:
#     def findMaxAverage(self, nums: List[int], k: int) -> float:
#         m = []
#         avg_k = []
#         fk = k
#         for i in range(len(nums)):
#             test = 0
#             for j in range(i, k):
#                 if k <= len(nums):
#                     test = test + nums[j]
#             m.append(test)
#             k = k+1
#         for z in range(len(m)):
#             avg_k.append(m[z]/fk)
#         return max(avg_k)


class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        # Calculate the sum of the first k elements
        current_sum = sum(nums[:k])
        max_sum = current_sum
        
        # Slide the window from the start to the end of the list
        for i in range(k, len(nums)):
            # Update the sum by subtracting the element going out of the window
            # and adding the element coming into the window
            current_sum = current_sum - nums[i - k] + nums[i]
            # Update the maximum sum if the current sum is greater
            max_sum = max(max_sum, current_sum)
        
        # The maximum average is the maximum sum divided by k
        return max_sum / k