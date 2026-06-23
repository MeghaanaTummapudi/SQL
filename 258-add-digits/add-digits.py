class Solution:
    def addDigits(self, num: int) -> int:
        
        # st_new = list(str(num))
        # print(st_new)
        # sm = 0
        # for i in range(len(st_new)):
        #     sm = sm + int(st_new[i])
        #     tsts = str(sm)
        #     if len(tsts) > 1:

        if len(str(num)) == 1:
            return num

        else:
            st_new = list(str(num))
            new = [int(st_new[i]) for i in range(len(st_new))]
            tot = sum(new)
            return self.addDigits(tot)


