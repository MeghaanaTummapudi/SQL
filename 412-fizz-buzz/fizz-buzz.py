class Solution:
    def fizzBuzz(self, n: int) -> List[str]:
        ans = []

        for i in range(1,  n+1):
            if i % 3 == 0 and i % 5 == 0:
                ans.append('FizzBuzz')

            elif i % 3 == 0:
                ans.append('Fizz')

            elif i % 5 == 0:
                ans.append('Buzz')

            else:
                ans.append(str(i))

        return (ans)

        
        # ans = []
        # for i in range(1, n + 1):
        #     ans.append(i)

        # for i in ans:
        #     if i % 3 == 0:
        #         ans[i - 1] = "Fizz"

        #     if i % 5 == 0:
        #         ans[i - 1] = "Buzz"
        #         if i % 3 == 0:
        #             ans[i - 1] = "FizzBuzz"

        # answer = [str(i) for i in ans]
        # return answer

    #   ans = []

    #   for i in range(1,  n+1):
    #     if i % 3 == 0 and i % 5 == 0:
    #         ans.append('FizzBuzz')

    #     elif i % 3 == 0:
    #         ans.append('Fizz')

    #     elif i % 5 == 0:
    #         ans.append('Buzz')

    #     else:
    #         ans.append(str(i))

    #  print(ans)
