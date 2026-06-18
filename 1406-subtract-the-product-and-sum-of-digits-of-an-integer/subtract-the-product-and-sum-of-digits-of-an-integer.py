class Solution:
    def subtractProductAndSum(self, n: int) -> int:
        st = str(n)
        prod = 1 
        su = 0

        for i in range(len(st)):
            prod = prod * int(st[i])
            su  = su + int(st[i])
       
        return (prod - su)

        