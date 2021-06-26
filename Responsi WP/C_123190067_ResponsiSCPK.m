data_rumah = xlsread('Real estate valuation data set.xlsx','C2:E51');
%mengambil data baris 1-50 kolom house age, distance to the nearest MRT station, number of convenience stores

harga = xlsread('Real estate valuation data set.xlsx','H2:H51');
%mengambil data baris 1-50 kolom house price of unit area.

x = [data_rumah harga];
%menggabungkan data_rumah dan harga sehingga diperoleh data rating kecocokan dari masing-masing alternatif

k = [1,0,1,0];
%atribut tiap-tiap kriteria, dimana nilai 1 = atrribut keuntungan, dan 0 = atribut biaya
%contohnya seperti pada tabel jarak terhadap MRT terdekat dan tabel harga,
%jika nilai kedua tabel semakin besar itu tidak memberikan keuntungan.

w = [3,5,4,1];
%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3=cukup, 4= tinggi, 5= sangat tinggi)

%tahapan pertama, perbaikan bobot

[m,n]=size (x);
%inisialisasi ukuran x

w=w./sum(w);
%membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)

for j=1:n
    if k(j)==0, w(j)=-1*w(j);
    end
end
for i=1:m
    S(i)=prod(x(i,:).^w);
end
%tahapan ketiga, proses perangkingan
V= S/sum(S)