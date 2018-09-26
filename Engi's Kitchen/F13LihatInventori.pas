Unit F13lihatInventori;

interface
uses uType;
Function hitungElement(T:Tinventori):integer;
Procedure writeinventori(T:Tinventori;N:Integer);
Procedure lihatinventori(T1:Tinventori;T2:TInventori);

implementation

Function hitungElement(T:Tinventori):integer;
var
	i:integer;
	AdaElement:boolean;	
begin
	hitungElement:=0;
	i:=1; 
	AdaElement:=True;
	while (i<=NMax) and (AdaElement) do
	begin
		if (T[i].nama='') then
		begin
			AdaElement:=False;
		end else
		begin
			hitungElement:=hitungElement+1;
			i:=i+1;
		end;
	end;
end;


Procedure writeinventori(T:Tinventori;N:Integer);
var
	i:integer;
begin
	for i:=1 to N do
	begin
		write(T[i].nama);
		write(' | ', T[i].Tanggal.Hari);
		write('/', T[i].Tanggal.Bulan);
		write('/', T[i].Tanggal.Tahun);
		write(' | ', T[i].jumlah);
		writeln();
	end;
end;


Procedure lihatinventori(T1:Tinventori;T2:TInventori);
var
	TMentah,TOlahan:TInventori;
	NMentah,NOlahan:integer;
	i,pass:integer;
	temp:inventori;
begin
	TMentah:=T1;
	TOlahan:=T2;
	NMentah:=hitungElement(TMentah);
	NOlahan:=hitungElement(TOlahan);
	if (NMentah>1) then
	begin
		for Pass:=1 to (NMentah-1) do
		begin
			for i:=NMentah downto (pass+1) do
			begin
				if  (TMentah[i].nama < TMentah[i-1].nama) then
				begin
					Temp:=TMentah[i];
					TMentah[i]:=TMentah[i-1];
					TMentah[i-1]:=Temp;
				end;
			end;
		end;
	end;
	if (NOlahan>1) then
	begin
		for Pass:=1 to (NOlahan-1) do
		begin
			for i:=NOlahan downto (pass+1) do
			begin
				if  (TOlahan[i].nama < TOlahan[i-1].nama) then
				begin
					Temp:=TOlahan[i];
					TOlahan[i]:=TOlahan[i-1];
					TOlahan[i-1]:=Temp;
				end;
			end;
		end;
	end;
	writeln('Daftar Bahan Mentah :');
	writeinventori(TMentah,NMentah);
	writeln('Daftar Bahan Olahan :');
	writeinventori(TOlahan,NOLahan);
end;

end.
