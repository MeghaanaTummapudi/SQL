"""class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        if len(word1) == len(word2):
            total = ''
            for i in range(len(word1)):
                test = word1[i]+word2[i]
                total += test
            return total

        if len(word1) < len(word2):
            total = ''
            for i in range(len(word1)):
                test = word1[i]+word2[i]
                total += test
                final = total + word2[i+1:]
            return final

        if len(word1) > len(word2):
            total = ''
            for i in range(len(word2)):
                test = word1[i] + word2[i]
                total += test
                final = total + word1[i+1:]
            return final
"""
class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        min_len = min(len(word1), len(word2))
        max_len = max(len(word1), len(word2))

        result = []

        for i in range(min_len):
            result.append(word1[i])
            result.append(word2[i])

        print(result)

        if len(word1) < len(word2):
            result.append(word2[min_len : ])
        else:
            result.append(word1[min_len : ])

        print(result)
        final = ''.join(result)
        return final

