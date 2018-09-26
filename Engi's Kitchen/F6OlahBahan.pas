unit F6OlahBahan;

interface
uses uType, sysutils;

var
	x : string; 
	cek,cek1,cek2,cek3 : boolean; 
	i,j,k,n,l : integer; 
	noSimulasi : integer;
	sim : TSimulasi;
	TInventoriBM : TInventori;
procedure olahBahan(var TBO : TBahanOlahan; var TIBM : TInventori; var TIBO : TInventori; var TBM : TBahanMentah);


implementation
procedure olahBahan(var TBO : TBahanOlahan; var TIBM : TInventori; var TIBO : TInventori; var TBM : TBahanMentah);

begin
	write('Nama bahan olahan yang ingin dibuat : ');
	readln(x);
	cek := false; 
	cek1 := false; 
	i := 1;
	while (cek = false) and (i <= length(TBM)) do
	begin
		if (x = TBM[i].Nama) then
		begin
		j:=1;
		k:=1;
			while (cek1 = false) and (j <= length(TBO[i].TabBahan)) do
			begin
				if (TBO[i].TabBahan[j] = TIBM[k].Nama) then
				begin
					cek2:=true;
					j:=j+1;
					TInventoriBM[k].Jumlah := TInventoriBM[k].Jumlah-1 ;
				end else
					k:=k+1;
			end;
			
			if (cek1=false) and (j>length(TBO)) then
			begin
				writeln('Bahan mentah tidak ditemukan untuk membuat bahan olahan.');
			end;
			
		end;

	if (cek2 = true) then
	begin
	l:=1;
	cek3:=false;
		while (l<=length(TIBO)) and (cek3=false) do
		begin
			if (TIBO[l].Nama = x) and (TIBO[j].Tanggal.Hari = sim[noSimulasi].Tanggal.Hari) then
			begin
				TIBO[l].Nama := x;
				TIBO[l].Jumlah := TIBO[l].Jumlah + n ;
				TIBO[l].Tanggal := sim[noSimulasi].Tanggal; //cara input tanggal sekarang gimana
				sim[noSimulasi].TotalBOBuat := sim[noSimulasi].TotalBOBuat + n;
				sim[noSimulasi].Energi := sim[noSimulasi].Energi - 1;
				writeln('Pembuatan Bahan Olahan sukses.');
				cek3 := true;
			end else if (TIBO[l].Nama = '0') then
			begin
				TIBO[l].Nama := x;
				TIBO[l].Jumlah := n;
				TIBO[l].Tanggal := sim[noSimulasi].Tanggal; //cara input tanggal sekarang gimana
				sim[noSimulasi].TotalBOBuat := sim[noSimulasi].TotalBOBuat +1;
				sim[noSimulasi].Energi := sim[noSimulasi].Energi - 1;
				writeln('Pembuatan Bahan Olahan sukses.');
				cek3 := true;
			end;
		l:=l+1;
		end;
		
		if (l>length(TInventoriBM)) and (cek3=false) then
		begin
			writeln('Inventori Penuh');
		end;
	
	writeln(sim[noSimulasi].TotalBMentah);
	writeln(TInventoriBM[i].Nama);
	writeln(TInventoriBM[i].Jumlah);
	writeln(TInventoriBM[i].Tanggal.Hari);
	writeln(sim[noSimulasi].TotalPengeluaran);
	writeln(sim[noSimulasi].Energi);
end;

end;


end;

end.
