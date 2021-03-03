f = open('/Users/zhangmin/Downloads/Walden.txt','r')
txt = f.read()
f.close()
txt = txt.lower()
words = txt.split()
word_index = set(words)
dic = {i:words.count(i) for i in word_index}
re = sorted(dic.items(),key=lambda asd:asd[1],reverse=True)
print(re)

