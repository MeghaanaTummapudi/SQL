class Solution:
    def interpret(self, command: str) -> str:
        # split string into list, parse over the list and use 
        # if - else stmt to map the conditions and return all of this to a new list and concat that list to form the final string
        new_l = list(command)
        tst = []
        print(new_l)
        for i in range(len(new_l)):
            if new_l[i] == 'G':
                tst.append('G')

            if new_l[i] == '(' and new_l[i+1] == ')':
                tst.append('o')

            if new_l[i] == '(' and new_l[i+1] == 'a' and new_l[i+2] == 'l' and new_l[i+3] == ')':
                tst.append('al')

        tst_str = ''.join(tst)
        return tst_str
