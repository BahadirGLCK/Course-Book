"""
195112016 Bahadır GÖLCÜK - Geri Süpürme Yöntemi Ödevi- Python Programlama Dili
"""

import numpy as np


def gauss_elimine(concatenated_matrix):
    """
    Birleştirilmiş olan sonuçlar ve değerler matrisini Gauss Elimine yöntemi ile çözümler.
    """

    satir, sutun = concatenated_matrix.shape
    sutun = sutun -1   # sonuçlar sutununu çıkartıyoruz

    for s in range(sutun):
        for e in range(s, satir):
            concatenated_matrix[e] =  concatenated_matrix[e] / concatenated_matrix[e][s]   # 1 yap
        for e in range(s+1, satir):
            concatenated_matrix[e] = concatenated_matrix[e] - concatenated_matrix[s]    # 0 yap

    eliminated_matris = concatenated_matrix
    return eliminated_matris

def geri_supurme(matris):
    """
    Geri supürme yöntemini uygular.
    """


    value_matris = matris[:,:matris.shape[0]]  
    result_matris = matris[:,matris.shape[0]]
    
    satir = value_matris.shape[0]   # 0 satırı temsil eder
    sutun = value_matris.shape[1]   # 1 sütunu temsil eder

    x = np.zeros(shape=(satir,1),dtype=float)   # bilinmeyenlerin matrisin tanımlanması yapılır

    for sat in range(satir-1 ,-1, -1):
        for e in range(sutun):

            result_matris[sat] = result_matris[sat] - value_matris[sat][e]*x[e]
        
        x[sat] = result_matris[sat] / value_matris[sat][sat]
    
    return x 






value_matris = np.array([[3.0,2.0,1.0],[2.0,1.0,0.0],[1.0,0.0,2.0]])       # değer matrisimiz
result_matris = np.array([[4.0,5.0,-9.0]])                                 # sonuç matrisimiz

# değerler ve sonuçlar matrislerini birleştirilir
concatenated_matrix = np.concatenate((value_matris,result_matris.T),axis=1)  
print("Concatenated Matris: ")
print(concatenated_matrix)

#birleştirilen matris gauss elimine işlemine sokulur
eliminated_matris = gauss_elimine(concatenated_matrix)                        
print("Gaus Elimine Sonucu: ")
print(eliminated_matris)

# Gauss Elimine işleminin sonucunda elde edilen matris geri süpürme işlemine sokulur
x = geri_supurme(eliminated_matris)                                           
print("Bilinmeyenlerin değerleri: ")                                       
print(x)


