class Solution:
    def fizzBuzz(self, n: int) -> List[str]:
        
        ans = []
        for i in range(1, n + 1):
            ans.append(i)

        for i in ans:
            # print(i)

            if i % 3 == 0:
                ans[i - 1] = "Fizz"

            if i % 5 == 0:
                ans[i - 1] = "Buzz"
                if i % 3 == 0:
                    ans[i - 1] = "FizzBuzz"

        # print(ans)

        answer = [str(i) for i in ans]
        return answer