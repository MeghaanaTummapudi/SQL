class Solution:
    def numberOfSteps(self, num: int) -> int:

        # count = 0
        # while num > 0: 
             
        #     if num % 2 == 0: 
        #         count = count + 1 
        #         num = num / 2 
            
        #     else: 
        #         count = count + 1 
        #         num = num - 1 
                
        # return (count)
        



        if num == 0:
            return 0

        if num % 2 == 0:
            return 1 + self.numberOfSteps(num // 2)
    
        else:
            return 1 + self.numberOfSteps(num - 1)