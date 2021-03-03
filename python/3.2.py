#神经网络算法 18.1.4
import math
import numpy as np
import pandas as pd
from pandas import DataFrame,Series
def sigmoid(x): #映射函数
    return 1/(1+math.exp(-x))
data_tr= pd.read_csv('F:/Python/3.3 data_tr.txt')

Net_in = np.array([.0, 0, -1]) #放置小数点，取浮点值
Out_in = np.array([.0, 0, 0, 0, -1])
W_mid = np.array([[0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0.3]])
W_out = np.array([0.3, 0.3, 0.3, 0.3, 0.3])
W_mid_delta= np.zeros([3,4])
W_out_delta= np.zeros(([5]))
for k in range(10000):
    for n in range(5):
        Net_in[0]=data_tr.ix[n,0]
        Net_in[1]= data_tr.ix[n,1]
        real= data_tr.ix[n,2]
        for i in range(4):
            Out_in[i] = sigmoid(sum(Net_in*W_mid[:, i]))
        res=sigmoid(sum(Out_in*W_out))
        yita=0.5
        W_out_delta= yita*res*(1-res)*(real-res)*Out_in
        W_out_delta= -(yita*res*(1-res)*(real-res))
        W_out = W_out_delta+ W_out
        for h in range(4):
            W_mid_delta[:,h]= yita*Out_in[h]*W_out[h]*res*(1-res)*(real-res)*Net_in
            W_mid_delta[2:h]= -(yita*Out_in[h]*W_out[h]*res*(1-res)*(real-res))
        W_mid = W_mid_delta+ W_mid
        print(k,'次第',n,'次: res:',res,',real:',real)

