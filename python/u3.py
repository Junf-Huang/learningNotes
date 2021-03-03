#绘制词云
import re
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
from wordcloud import WordCloud
f = open('/Users/zhangmin/Downloads/Walden.txt','r')
text = f.read()
f.close()
words = text.split() #将字符串打断成单词
words1 = [word.lower() for word in words]  #将大写字母转换成小写的
words2 = [re.sub("[,'.:;]",'',word) for word in words1]  #去掉标点符号
words_index = set(words)  #去重复
dic = {index:words2.count(index) for index in words_index} #统计词频
re = sorted(dic.items(),key=lambda asd:asd[1],reverse=True)    #排序
print(re)

image= Image.open('./cloud.jpg')  #轮廓图片
graph = np.array(image)           #读成像素矩阵

wc =WordCloud(background_color='White',mask=graph) #设置词云背景颜色及形状
wc.generate_from_frequencies(dic)  #读进词频数据
plt.imshow(wc)
# plt.axis("off") #去除坐标轴
plt.show()
