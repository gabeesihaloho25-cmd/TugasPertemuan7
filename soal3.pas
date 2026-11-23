
program HasilStudiMahasiswa; 

uses crt; 

type
  TMahasiswa = record
    nama: string; // Menyimpan nama mahasiswa
    nim: string; // Menyimpan NIM mahasiswa
  end;

var
  mhs: TMahasiswa; // Variabel data mahasiswa
  matkul: array[1..10] of string; // Nama mata kuliah
  sks: array[1..10] of integer; // Jumlah SKS
  huruf: array[1..10] of string; // Nilai huruf
  mutu: array[1..10] of real; // Nilai mutu
  hasil: array[1..10] of real; // Hasil SKS dikali mutu
  n, i: integer; // Jumlah mata kuliah dan perulangan
  totalSKS: integer; // Menyimpan total SKS
  totalNilai, IP: real; // Menyimpan total nilai dan IP

begin
  clrscr; 

  write('Nama Mahasiswa: ');
  readln(mhs.nama); // Input nama mahasiswa
  write('NIM: ');
  readln(mhs.nim); // Input NIM mahasiswa
  write('Jumlah Mata Kuliah: ');
  readln(n); // Input jumlah mata kuliah

  totalSKS := 0; // Mengatur total SKS menjadi nol
  totalNilai := 0; // Mengatur total nilai menjadi nol

  for i := 1 to n do
  begin
    writeln; // Memberikan jarak antarinput

    write('Nama Mata Kuliah: ');
    readln(matkul[i]); // Input nama mata kuliah

    write('Jumlah SKS: ');
    readln(sks[i]); // Input jumlah SKS

    write('Nilai Huruf (A,B+,B,C+,C,D,E): ');
    readln(huruf[i]); // Input nilai huruf

    if huruf[i] = 'A' then mutu[i] := 4
    else if huruf[i] = 'B+' then mutu[i] := 3.5
    else if huruf[i] = 'B' then mutu[i] := 3
    else if huruf[i] = 'C+' then mutu[i] := 2.5
    else if huruf[i] = 'C' then mutu[i] := 2
    else if huruf[i] = 'D' then mutu[i] := 1
    else if huruf[i] = 'E' then mutu[i] := 0;
    // Mengubah nilai huruf menjadi nilai mutu

    hasil[i] := sks[i] * mutu[i]; // Menghitung nilai mata kuliah

    totalSKS := totalSKS + sks[i]; // Menjumlahkan seluruh SKS

    totalNilai := totalNilai + hasil[i];
    // Menjumlahkan seluruh hasil nilai mata kuliah
  end;

  IP := totalNilai / totalSKS; // Menghitung indeks prestasi

  writeln; // Memberikan jarak
  writeln('========== HASIL STUDI ==========');
  writeln('Nama: ', mhs.nama); // Menampilkan nama
  writeln('NIM : ', mhs.nim); // Menampilkan NIM

  writeln; // Memberikan jarak
  writeln('Mata Kuliah  SKS  Nilai  Mutu  Hasil');

  for i := 1 to n do
  begin
    writeln(matkul[i], '  ', sks[i], '  ',
    huruf[i], '  ', mutu[i]:0:1, '  ', hasil[i]:0:1);
    // Menampilkan seluruh data mata kuliah
  end;

  writeln; // Memberikan jarak
  writeln('Total SKS   : ', totalSKS); // Menampilkan total SKS
  writeln('Total Nilai : ', totalNilai:0:1); // Menampilkan total nilai
  writeln('IP          : ', IP:0:2); // Menampilkan IP

  readln; // Menahan tampilan agar tidak langsung tertutup
end.
