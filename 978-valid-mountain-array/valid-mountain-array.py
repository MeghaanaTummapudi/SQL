class Solution:
    def validMountainArray(self, arr: List[int]) -> bool:
        
        # if len(listarr) < 3:
        #     return False

        point = 0
        if len(set(arr)) >= 3:
            for i in range(len(arr) - 1):
                j = i + 1

                if arr[i] >= arr[j]:
                    point = i
                    break
            # print(point)
            if point == 0 or point == len(arr):
                return False
            for i in range(point, len(arr) - 1):
                j = i + 1
                print(i, j)
                if arr[i] <= arr[j]:
                    return False
            return True

        else:
            return False