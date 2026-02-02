class Solution:
    def mostWordsFound(self, sentences: List[str]) -> int:
        count_ls = []
        # for sent in sentences:
        #     words = sent.split(" ")
        #     len_ls = len(words)
        #     count_ls.append(len_ls)
        # return (max(count_ls))
        count_ls = [len(sent.split(" ")) for sent in sentences]
        return (max(count_ls))
