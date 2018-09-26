unit uValidasiTanggal;	

interface
  uses uType;
  function isTanggalValid(Tanggal:Date):boolean;   

implementation
  function isTanggalValid(Tanggal:Date):boolean;   
    begin
       isTanggalValid:=False;
      {Bukan februari}
       if((Tanggal.Bulan=01) or
          (Tanggal.Bulan=03) or  
          (Tanggal.Bulan=05) or  
          (Tanggal.Bulan=07) or  
          (Tanggal.Bulan=08) or  
          (Tanggal.Bulan=10) or  
          (Tanggal.Bulan=12) and
         ((Tanggal.Hari>=1)  and (Tanggal.Hari<=31)))
          or
         ((Tanggal.Bulan=04) or
          (Tanggal.Bulan=06) or  
          (Tanggal.Bulan=09) or  
          (Tanggal.Bulan=11) and
         ((Tanggal.Hari>=1)  and (Tanggal.Hari<=30))) 
       then
          isTanggalValid:= True
       else
       {februari}
       if (Tanggal.Bulan=2) then begin
         if (Tanggal.Hari>=1)  and (Tanggal.Hari<=28) then isTanggalValid:= True else
         if (Tanggal.Hari=29) and {kabisat}(((Tanggal.Tahun mod 4=0) and not(Tanggal.Tahun mod 100 =0)) or (Tanggal.Tahun mod 400=0)) then isTanggalValid:= True;
       end;
         
       
    end; 	
END.

