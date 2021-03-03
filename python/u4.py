dic = {'q':1,'a':10}
re = dic.items()
re = sorted(dic.items(),key=lambda asd:asd[1],reverse=True)
print(re)