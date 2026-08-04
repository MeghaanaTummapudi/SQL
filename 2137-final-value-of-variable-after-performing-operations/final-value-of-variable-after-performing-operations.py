class Solution:
    def finalValueAfterOperations(self, operations: List[str]) -> int:
        
        x = 0

        for y in operations:
            if y == "--X" or y == "X--":
                x = x - 1

            if y == "++X" or y == "X++":
                x = x + 1

        return x