unit uTambahTanggal;

interface
uses uType;

  procedure TambahTanggal(var Tanggal :Date);
  
implementation
   
   procedure TambahTanggal(var Tanggal :Date);
   //Terdapat 3 kemungkinan jika ingin menambah tanggal
   //Jika di bulan itu ada 30 hari --Maka kalau tanggal 30, tanggal jadi tanggal 1, bulannya jadi bulan+1
   //Jika di bulan itu ada 31 hari --Maka kalau tanggal 31, tanggal jadi tanggal 1, bulannya jadi bulan+1
   //Jika bulan itu februari //kalau Gak kabisat, tanggal jadi tanggal 1, bulannya jadi bulan+1
                             //Kalau Kabisat, tanggalnya jadi tanggal 29, bulannya ga berubah
   begin
       {kalo bulan yang tanggalnya ada 31 dan bukan desember}
       if (Tanggal.Bulan=01 ) or
          (Tanggal.Bulan=03 ) or  
          (Tanggal.Bulan=05 ) or  
          (Tanggal.Bulan=07 ) or  
          (Tanggal.Bulan=08 ) or  
          (Tanggal.Bulan=10 ) 
       then
       begin
       
          //Tanggal awal-awal
          if (Tanggal.Hari>=1) and (Tanggal.Hari<=30) then
          begin 
             Tanggal.Hari:=Tanggal.Hari+1;    
          end else 
          //Tanggal 31
          begin
             Tanggal.Hari:=01;
             Tanggal.Bulan:=Tanggal.Bulan+1;
          end;    
       end else 
       
       {kalo bulan yang tanggalnya ada 31 dan desember}
       if (Tanggal.Bulan=12 )
       then
       begin
       
         //Tanggal awal-awal
          if (Tanggal.Hari>=1) and (Tanggal.Hari<=30) then
          begin 
             Tanggal.Hari:=Tanggal.Hari+1;    
          end else 
          //Tanggal 31
          begin
             Tanggal.Hari  := 01;
             Tanggal.Bulan := 01;
             Tanggal.Tahun := Tanggal.Tahun+1;
          end;    
       end else
      
       {kalo bulan yang tanggalnya ada 30}
       if(Tanggal.Bulan=04 ) or
         (Tanggal.Bulan=06 ) or  
         (Tanggal.Bulan=09 ) or  
         (Tanggal.Bulan=11 )   
       then
       begin
         
         //Tanggal awal-awal
         if (Tanggal.Hari>=1) and (Tanggal.Hari<=29) then
         begin 
             Tanggal.Hari:=Tanggal.Hari+1;    
         end else
         //tanggal 30 
         begin
             Tanggal.Hari:=01;
             Tanggal.Bulan:=Tanggal.Bulan+1;
         end;  
       end else
                  
       {Kalo yang februari}
       begin
         //Tanggal awal-awal
         if (Tanggal.Hari>=1) and (Tanggal.Hari<=27) then
         begin 
             Tanggal.Hari:=Tanggal.Hari+1; 
         end else
         //Tanggal 28
         begin
             //Kabisat
             if ((Tanggal.Tahun mod 4=0) and not(Tanggal.Tahun mod 100 =0)) or (Tanggal.Tahun mod 400=0) then
             Tanggal.Hari:=Tanggal.Hari+1
             else                                                                
             //Bukan Kabisat
             begin                                                            
                 Tanggal.Hari:=01;
                 Tanggal.Bulan:=Tanggal.Bulan+1;
             end;
         end; 
       end;
   end;  
END. 

