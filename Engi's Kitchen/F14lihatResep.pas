Unit F14lihatResep;

interface
uses uType;
Procedure lihatResep(T:TResep);
	
implementation

Procedure lihatResep(T:Tresep);
var
	TTemp:TResep;
	i,j,N:integer;
	pass:integer;
	Temp:Resep;
	AdaElement:Boolean;
begin
	TTemp:=T; {menyimpan daftar resep dalam array yang baru agar daftar yang asli tidak terpengaruhi}
	N:=0; {inisialisasi jumlah resep dalam array}
	{Algoritma menghitung elemen pada array}
	i:=1; 
	AdaElement:=True;
	while (i<=NMax) and (AdaElement) do
	begin
		if (TTemp[i].nama='') then
		begin
			AdaElement:=False;
		end else
		begin
			N:=N+1;
			i:=i+1;
		end;
	end;
	{Algoritma sortir resep berdasarkan nama, skema bubblesorting}
	if (N>1) then
	begin
		for Pass:=1 to (N-1) do
		begin
			for i:=N downto (pass+1) do
			begin
				if  (TTemp[i].nama < TTemp[i-1].nama) then
				begin
					Temp:=TTemp[i];
					TTemp[i]:=TTemp[i-1];
					TTemp[i-1]:=Temp;
				end;
			end;
		end;
	end;
	{Algoritma penulisan resep di layar}
	for i:=1 to N do
	begin
		write(TTemp[i].nama);
		write(' | ', TTemp[i].Harga);
		write(' | ', TTemp[i].N);
		for j:=1 to TTemp[i].N do
		begin
			write(' | ', TTemp[i].TabBOLahan[j]);
		end;
		writeln();
	end;
end;

end.
