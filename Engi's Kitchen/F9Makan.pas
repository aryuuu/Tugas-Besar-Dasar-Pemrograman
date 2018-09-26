unit F9Makan;

interface

  procedure makan(var Energi:integer; var BanyakMakan:integer);
 {menambah energi Chef sebanyak 3 buah, hanya dapat dilakukan sebanyak 3 kali dalam sehari dengan energi maksimalnya 10}

implementation
  procedure makan(var Energi:integer; var BanyakMakan:integer);
    
begin
     if (BanyakMakan<3) then begin
        //Jika energinya masih bisa menjadi 10 tambahkan energi sebanyak 3 buah
        if (Energi<=7) then begin
            Energi:=Energi+3;
            BanyakMakan:= BanyakMakan+1; 
        end else 
        //Kalo energinya diantara 7 sampe 10 energinya jadi 10                                                                                   
        if (Energi>7) and (Energi<=10) then begin
            Energi:=10;
            BanyakMakan:=BanyakMakan+1; end;
      
     writeln('Perut terisi :)');       
     end else 
     writeln('Sudah 3x makan');
end;    

end.

