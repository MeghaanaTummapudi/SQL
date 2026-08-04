class Solution:
    def mostWordsFound(self, sentences: List[str]) -> int:
        
        # tst = [None] * len(sentences)
        count = [None] * len(sentences)
        tst = sentences[0]
        # print(len(tst.split()))

        for i in range(len(sentences)):
            new = sentences[i]
            length = len(new.split())
            count[i] = length
        
        return max(count)