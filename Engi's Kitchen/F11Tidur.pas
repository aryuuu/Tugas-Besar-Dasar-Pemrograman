unit F11Tidur;

interface
  uses uType, uTambahTanggal, uKadaluarsa;
  procedure tidur(var Tanggal :Date; var HarHid : integer; var energi:integer; var ArrBahanMen: TBahanMentah;  
				  var ArrInvMentah : Tinventori;var ArrInvOlahan: Tinventori; var BanyakIstirahat:integer; var BanyakMakan:integer);
																																																							
implementation		

																																			
  procedure tidur(var Tanggal :Date; var HarHid : integer; var energi:integer; var ArrBahanMen: TBahanMentah;  
				  var ArrInvMentah : Tinventori;var ArrInvOlahan: Tinventori; var BanyakIstirahat:integer; var BanyakMakan:integer);
  var i : integer;
    begin
    //aksi sebelumnya tidur saat energinya penuh (belum melakukan aksi yg mengurangi energi)
    //atau banyak makan dan banyak istirahat = 0
      if (energi<10) or ( (BanyakIstirahat>0) or (BanyakMakan>0) ) then 
      begin
        energi:=10;
        
        TambahTanggal(Tanggal);
        HarHid:=HarHid+1;
        
        //banyak makan dan istirahat ke reset
        BanyakMakan:=0; 
        BanyakIstirahat:=0;
        
        //Ngehapus bahan Mentah yang kadaluarsa 
        for i:=1 to NMax do
        begin
	      if (Tanggal.Tahun=TanggalKadaluarsaBMen(ArrInvMentah[i], ArrBahanMen[i]).Tahun) and
			 (Tanggal.Bulan=TanggalKadaluarsaBMen(ArrInvMentah[i], ArrBahanMen[i]).Bulan) and
			 (Tanggal.Hari=TanggalKadaluarsaBMen(ArrInvMentah[i], ArrBahanMen[i]).Hari)  
	      then begin
			 ArrInvMentah[i].Nama := 'kosong';
	      end;
        end;
        
        //Ngehapus bahan Olahan yang kadaluarsa
        for i:=1 to NMax do
        begin
	      if (Tanggal.Tahun=TanggalKadaluarsaBOla(ArrInvOlahan[i]).Tahun) and
			 (Tanggal.Bulan=TanggalKadaluarsaBOla(ArrInvOlahan[i]).Bulan) and
			 (Tanggal.Hari=TanggalKadaluarsaBOla(ArrInvOlahan[i]).Hari)  
	      then begin
			 ArrInvOlahan[i].Nama := 'kosong';
	      end;
        end; 
     end; 
    end;	
  
END.

