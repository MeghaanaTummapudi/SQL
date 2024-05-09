class Solution:
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
        