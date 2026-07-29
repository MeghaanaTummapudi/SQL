class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:

        n1 = nums1[:m]
        n2 = nums2[:n]
        n = n1 + n2
        print(n)

        abc = len(n)
        for i in range(abc):
            swapped = False

        # Last i elements are already in place
            for j in range(0, abc-i-1):

            # Traverse the array from 0 to n-i-1
            # Swap if the element found is greater
            # than the next element
                if n[j] > n[j+1]:
                    n[j], n[j+1] = n[j+1], n[j]
                    swapped = True
            if (swapped == False):
                break
        # print(n)
        nums1[:] = n[:]
        return nums1