unit F5BeliBahan;

interface
uses uType, sysutils;

	
procedure beliBahan(var TBM : TBahanMentah; var sim :simulasi;TInventoriBM : TInventori);


implementation

procedure beliBahan(var TBM : TBahanMentah; var sim :simulasi;TInventoriBM : TInventori);
	//Prosedur untuk membeli bahan mentah yang dibeli dari supermarket dan
	//disimpan dalam inventori barang mentah.

var
	x : string; 
	cek,cek1 : boolean; 
	i,n,j : integer;
	
begin
	write('Nama bahan : ');
	readln(x);
	cek := false; 
	i := 1;
	while (cek = false) and (i <= length(TBM)) do
	begin
		if (x = TBM[i].Nama) then
		begin
			write('Kuantitas : ');
			readln(n);
			if (n * TBM[i].Harga < sim.TotalUang) then
			begin
				cek := true;
			end else
			begin
				writeln('Pembelian barang gagal karena uang tidak cukup.');
			end;
		end else
		begin
			i := i + 1;
		end;
	end;
	
	if (cek=false) and (i>length(TBM)) then
	begin
		writeln('Bahan tidak ada di pasar');
	end;
	
	if (cek = true) then
	begin
	j:=1;
	cek1:=false;
		while (j<=length(TInventoriBM)) and (cek1=false) do
		begin
			if (TInventoriBM[j].Nama = x) and (TInventoriBM[j].Tanggal.Hari = sim.Tanggal.Hari) then		 
			begin
				TInventoriBM[j].Nama := x;
				TInventoriBM[j].Jumlah := TInventoriBM[j].Jumlah + n ;
				TInventoriBM[j].Tanggal := sim.Tanggal; //cara input tanggal sekarang gimana
				sim.TotalBMentah := sim.TotalBMentah + n;
				sim.TotalPengeluaran := sim.TotalPengeluaran + (n * TBM[i].harga);
				sim.Energi := sim.Energi - 1;
				writeln('Pembelian sukses.');
				cek1 := true;
			end else if (TInventoriBM[j].Nama = '0') then
			begin
				TInventoriBM[j].Nama := x;
				TInventoriBM[j].Jumlah := n;
				TInventoriBM[j].Tanggal := sim.Tanggal; //cara input tanggal sekarang gimana
				sim.TotalBMentah := sim.TotalBMentah + n;
				sim.TotalPengeluaran := sim.TotalPengeluaran + (n * TBM[i].harga);
				sim.Energi := sim.Energi - 1;
				writeln('Pembelian sukses.');
				cek1 := true;
			end;
		j:=j+1;
		end;
		
		if (j>length(TInventoriBM)) and (cek1=false) then
		begin
			writeln('Inventori Penuh');
		end;
		
		
	end;
	
end;

end.
