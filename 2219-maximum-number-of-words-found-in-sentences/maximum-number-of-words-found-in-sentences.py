class Solution:
    def mostWordsFound(self, sentences: List[str]) -> int:
        m = len(sentences)
        count_ls = []
        for sent in sentences:
            words = sent.split(" ")
            # print(words)
            len_ls = len(words)
            # print(len_ls)
            count_ls.append(len_ls)
        return (max(count_ls))
