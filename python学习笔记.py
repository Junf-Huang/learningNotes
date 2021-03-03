#关键词须知：
#顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数
# 字典
#返回None的时候Python的交互式命令行不显示结果
#key不能重复
#SMTP服务是25端口，FTP服务是21端口

#使用list和tuple
classmates = ['Michael', 'Bob', 'Tracy']
classmates[0] == classmates[-3]
classmates.append('Adam')
classmates.insert(1, 'Jack')
#删除list末尾的元素
classmates.pop()
#删除指定位置的元素
classmates.pop(1)
#把某个元素替换成别的元素
classmates[1] = 'Sarah'
#list里面的元素的数据类型可以不同
L = ['Apple', 123, True]
s = ['python', 'java', ['asp', 'php'], 'scheme']
#list长度
len(s)
#tuple一旦初始化就不能修改，tuple的每个元素指向永远不变
classmates = ('Michael', 'Bob', 'Tracy')
#与list相比，只有下面两种方法
classmates[0] == classmates[-1]
#定义的不是tuple，是1这个数
t = (1)
#只有1个元素的tuple定义时必须加一个逗号，消除歧义
t = (1,)


#使用dict和set
#dict也称为map，使用键-值（key-value）存储
>>> d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
>>> d['Michael']
95

>>> d['Adam'] = 67
>>> d['Adam']
67

#in判断key是否存在
>>> 'Thomas' in d
False

#删除一个key，用pop(key)方法,对应的value也会从dict中删除
>>> d.pop('Bob')
75
>>> d
{'Michael': 95, 'Tracy': 85}

#list与dic比较：
#dic
#查找和插入的速度极快，不会随着key的增加而变慢
#需要占用大量的内存，内存浪费多
#list
#查找和插入的时间随着元素的增加而增加
#占用空间小，浪费内存很少

#set，不存储value，key的集合体
#要创建一个set，需要提供一个list作为输入集合
s = set([1, 2, 3])
#重复元素在set中自动被过滤：
s = set([1, 1, 2, 2, 3, 3])
s
{1, 2, 3}   
#通过add(key)方法可以添加元素到set中
s.add(4)
#通过remove(key)方法可以删除元素：
s.remove(4)
#set可以看成数学意义上的无序和无重复元素的集合
#可以做交集、并集
# x & y # 交集 
# x | y # 并集 
# x - y # 差集 

#切片
#打印前3个元素
L[0:3] == L[:3]
#前10个数，每2个取一个：
L[:10:2]
#所有数，每5个取一个
L[::5]
#打印整个list
L[:]
#tuple与字符串
>>> (0, 1, 2, 3, 4, 5)[:3]
(0, 1, 2)
>>> 'ABCDEFG'[:3]
'ABC'

#判断是否可迭代对象
from collections import Iterable
>>> isinstance('abc', Iterable) # str是否可迭代
True
>>> isinstance(123, Iterable) # 整数是否可迭代
False

#enumerate函数可以把一个list变成索引-元素对
for i, value in enumerate(['A', 'B', 'C']):
     print(i, value)
0 A
1 B
2 C
#同时引用了两个变量
for x, y in [(1, 1), (2, 4), (3, 9)]:
    print(x, y)
1 1
2 4
3 9

#生成[1x1, 2x2, 3x3, ..., 10x10]
[x * x for x in range(1, 11)]
[x * x for x in range(1, 11)]
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

#默认参数必须指向不变对象！
def add_end(L=None):
    if L is None:
        L = []
    L.append('END')
    return L

#可变参数
#参数numbers接收到的是一个tuple
#加*号，可以传入任意个参数，包括0个参数
def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum

#*nums表示把nums这个list的所有元素作为可变参数传进去
nums = [1, 2, 3]
>>> calc(*nums)

#关键字参数
#关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict
def person(name, age, **kw):
    print('name:', name, 'age:', age, 'other:', kw)

>>> person('Adam', 45, gender='M', job='Engineer')
name: Adam age: 45 other: {'gender': 'M', 'job': 'Engineer'}
#简写
>>> extra = {'city': 'Beijing', 'job': 'Engineer'}
>>> person('Jack', 24, **extra)
name: Jack age: 24 other: {'city': 'Beijing', 'job': 'Engineer'}

#命名关键字参数
#限制关键字参数的名字，*后面的参数被视为命名关键字参数
def person(name, age, *, city, job):
    print(name, age, city, job)

#如果函数定义中有一个可变参数，后面的命名关键字参数就不必特殊分隔符*
def person(name, age, *args, city, job):
    print(name, age, args, city, job)

#命名关键字参数必须传入参数名，这和位置参数不同。如果没有传入参数名，调用将报错
>>person('Jack', 24, city='Beijing', job='Engineer')


#read()
read():一次性读取文件的全部内容
read(size):每次最多读取size个字节的内容
readline():每次读取一行内容

