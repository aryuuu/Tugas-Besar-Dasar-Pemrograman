unit F10Istirahat;

interface

procedure istirahat(var Energi:integer; var BanyakIstirahat:integer);
  {menambah energi Chef sebanyak 1 buah, 
   hanya dapat dilakukan sebanyak 6 kali dalam sehari dengan energi maksimalnya 10}
    {Nanti tambahin variabel BanyakTidur di variabel global} 

implementation
  procedure istirahat(var Energi:integer; var BanyakIstirahat:integer);
    begin
     if (BanyakIstirahat<6) then begin
      //Jika energinya masih bisa menjadi 10 dan masih belum istirahat 6 kali, tambahkan energi sebanyak 1 buah
      if (energi<=9) then   begin
          energi:=energi+1; end;                                       
      BanyakIstirahat:=BanyakIstirahat+1;
     end;
    writeln('YES'); 
    end;
end.
