import numpy as np
import matplotlib.pyplot as plt

def create_matris(x,y,degree):
    """
    Değer ve sonuç matrislerini Least Square metodunun türevlenmiş halinden oluşturur.

    Args:

        x: np.array. Verilen x deneyleri
        y: np.array. X deneylerinin sonuçları 
        degree: Int. Uydurulacak polinomun derecesi.
    
    Return:

        value_matris: np.array. Least square metodundan sonra oluşan değer matrisi
        result_matris: np.array. Least square metodundan sonra oluşan sonuç matrisi
    """
    value_matris = np.zeros(shape=(degree+1,degree+1))
    result_matris = np.zeros(shape=(degree+1,1))
    satır,sutun = value_matris.shape

    for p in range(satır):
        for s in range(sutun):
            if s == 0 and p==0:
                value_matris[p][s] = len(x)

            value_matris[p][s] = sum(x**(s+p))
            result_matris[p][0] = sum((x**p)*y)

    return value_matris, result_matris


def create_fonk(x,value_matris,result_matris):
    """
    Değer ve sonuç matrislerine göre çıkan a değerleri ile fonsiyonu oluşturmak.
    value _matris*a = result_matris => a = (value_matris)^-1 * result_matris

    Args:

        x: np.array. Verilen x deneyleri
        value_matris: np.array. Least square metodundan sonra oluşan değer matrisi
        result_matris: np.array. Least square metodundan sonra oluşan sonuç matrisi

    Attributes:

        value_matris_inv: np.array. Değer matrisinin tersi
        a: np.array. Katsayılar matrisi

    Return:

        fx: Int. Fonksiyonun sonucu

    """

    # value_matris*a = result_matris olduğundan a ların değerleri bulunuyor
    value_matris_inv = np.linalg.inv(value_matris)
    a = np.dot(value_matris_inv,result_matris)

    satır,sutun = a.shape

    fx = 0 

    for s in range(satır):
        fx += a[s][0]*(x**s)
    
    return fx


if __name__ == "__main__":
    #x = np.array([0.0, 2.0, 3.0, 5.0, 8.0])
    #y = np.array([-6.0, 0.0, 7.0, 21.0, 65.0])
    #x = np.array([0.0, 1.0, 2.0, 4.0, 7.0])
    #y = np.array([1.0, 5.0, 8.0, 13.0, 21.0])
    x = np.array([0.0, 2.0, 5.0, 9.0, 15.0, 25.0, 40.0])
    y = np.array([5.0, 12.0, 23.0, 37.0, 44.0, 60.0, 81.0])

    deg = 5

    v_m, r_m = create_matris(x,y,deg)
    fx = create_fonk(x,v_m,r_m)

    # Plot
    plt.plot(x,y,'k o',x,fx,'r')
    plt.show()
















































