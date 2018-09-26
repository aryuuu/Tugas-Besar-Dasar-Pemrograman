Unit F2Exit;
interface
uses uType;
procedure exit(var listBahanMentah : TBahanMentah; var listBahanOlahan : TBahanOlahan; var listInventoriMentah : TInventori; var listInventoriOlahan : TInventori; var listResep : TResep; var listSimulasi : TSimulasi);

implementation 
procedure exit(var listBahanMentah : TBahanMentah; var listBahanOlahan : TBahanOlahan; var listInventoriMentah : TInventori; var listInventoriOlahan : TInventori; var listResep : TResep; var listSimulasi : TSimulasi);

var
	f : text;
	i, j : integer;
begin
	// This code has been tested.
	assign(f, 'BahanMentah.txt');
	rewrite(f);
	i := 1;
	while not((listBahanMentah[i].Nama = '') and (listBahanMentah[i].Harga = 0) and (listBahanMentah[i].Durasi = 0)) do begin
		write(f, listBahanMentah[i].Nama);
		write(f, ' | ');
		write(f, listBahanMentah[i].Harga);
		write(f, ' | ');
		write(f, listBahanMentah[i].Durasi);
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// This code has been tested.
	assign(f, 'BahanOlahan.txt');
	rewrite(f);
	i := 1;
	while not((listBahanOlahan[i].Nama = '') and (listBahanOlahan[i].Harga = 0) and (listBahanOlahan[i].N = 0)) do begin
		write(f, listBahanOlahan[i].Nama);
		write(f, ' | ');
		write(f, listBahanOlahan[i].Harga);
		write(f, ' | ');
		write(f, listBahanOlahan[i].N);
		for j := 1 to listBahanOlahan[i].N do begin
			write(f, ' | ');
			write(f, listBahanOlahan[i].TabBahan[j]);
		end;
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// Has been tested !
	assign(f, 'InventoriBahanMentah.txt');
	rewrite(f);
	i := 1;
	while not((listInventoriMentah[i].Nama = '') and (listInventoriMentah[i].Tanggal.Hari = 0) and (listInventoriMentah[i].Jumlah = 0)) do begin
		write(f, listInventoriMentah[i].Nama);
		write(f, ' | ');
		write(f, listInventoriMentah[i].Tanggal.Hari);
		write(f, '/');
		write(f, listInventoriMentah[i].Tanggal.Bulan);
		write(f, '/');
		write(f, listInventoriMentah[i].Tanggal.Tahun);
		write(f, ' | ');
		write(f, listInventoriMentah[i].Jumlah);
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// Has been tested !
	assign(f, 'InventoriBahanOlahan.txt');
	rewrite(f);
	i := 1;
	while not((listInventoriOlahan[i].Nama = '') and (listInventoriOlahan[i].Tanggal.Hari = 0) and (listInventoriOlahan[i].Jumlah = 0)) do begin
		write(f, listInventoriOlahan[i].Nama);
		write(f, ' | ');
		write(f, listInventoriOlahan[i].Tanggal.Hari);
		write(f, '/');
		write(f, listInventoriOlahan[i].Tanggal.Bulan);
		write(f, '/');
		write(f, listInventoriOlahan[i].Tanggal.Tahun);
		write(f, ' | ');
		write(f, listInventoriOlahan[i].Jumlah);
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// Has been tested !
	assign(f, 'Resep.txt');
	rewrite(f);
	i := 1;
	while not((listResep[i].Nama = '') and (listResep[i].Harga = 0) and (listResep[i].N = 0)) do begin
		write(f, listResep[i].Nama);
		write(f, ' | ');
		write(f, listResep[i].Harga);
		write(f, ' | ');
		write(f, listResep[i].N);
		for j := 1 to listResep[i].N do begin
			write(f, ' | ');
			write(f, listResep[i].TabBOlahan[j]);
		end;
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// Has been tested !
	assign(f, 'Simulasi.txt');
	rewrite(f);
	i := 1;
	while not((listSimulasi[i].Nomor = 0) and (listSimulasi[i].Tanggal.Hari = 0) and (listSimulasi[i].HariHidup = 0)) do begin
		write(f, listSimulasi[i].Nomor);
		write(f, ' | ');
		write(f, listSimulasi[i].Tanggal.Hari);
		write(f, '/');
		write(f, listSimulasi[i].Tanggal.Bulan);
		write(f, '/');
		write(f, listSimulasi[i].Tanggal.Tahun);
		write(f, ' | ');
		write(f, listSimulasi[i].HariHidup);
		write(f, ' | ');
		write(f, listSimulasi[i].Energi);
		write(f, ' | ');
		write(f, listSimulasi[i].KInventori);
		write(f, ' | ');
		write(f, listSimulasi[i].TotalBMentah);
		write(f, ' | ');
		write(f, listSimulasi[i].TotalBOBuat);
		write(f, ' | ');
		write(f, listSimulasi[i].TotalBOJual);
		write(f, ' | ');
		write(f, listSimulasi[i].TotalResepJual);
		write(f, ' | ');
		write(f, listSimulasi[i].TotalPemasukan);
		write(f, ' | ');
		write(f, listSimulasi[i].TotalPengeluaran);
		write(f, ' | ');
		write(f, listSimulasi[i].TotalUang);
		i := i + 1;
		writeln(f);
	end;
	close(f);
end;

end.
