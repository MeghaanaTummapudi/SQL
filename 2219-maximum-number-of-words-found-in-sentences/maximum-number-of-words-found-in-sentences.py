class Solution:
    def mostWordsFound(self, sentences: List[str]) -> int:
        
        # count = [None] * len(sentences)

        # for i in range(len(sentences)):
        #     new = sentences[i]
        #     length = len(new.split())
        #     count[i] = length
        
        # return max(count)

        count = 0

        for i in range(len(sentences)):
            new = sentences[i]
            length = len(new.split(" "))
            if count < length:
                count = length
        return count