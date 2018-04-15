procedure F2exit(var bahanMentah : TBahanMentah; var bahanOlahan : TBahanOlahan; var inventoriMentah : TInventori; var inventoriOlahan : TInventori; var resep : TResep; var simulasi : TSimulasi);
var
	f : text;
	data : string;
	i, j, k, lenToBeCut, guard : integer;

begin
	// This code has been tested.
	assign(f, 'BahanMentah.txt');
	rewrite(f);
	i := 1;
	while not((bahanMentah[i].Nama = '') and (bahanMentah[i].Harga = 0) and (bahanMentah[i].Durasi = 0)) do begin
		write(f, bahanMentah[i].Nama);
		write(f, ' | ');
		write(f, bahanMentah[i].Harga);
		write(f, ' | ');
		write(f, bahanMentah[i].Durasi);
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// This code has been tested.
	assign(f, 'BahanOlahan.txt');
	rewrite(f);
	i := 1;
	while not((bahanOlahan[i].Nama = '') and (bahanOlahan[i].Harga = 0) and (bahanOlahan[i].N = 0)) do begin
		write(f, bahanOlahan[i].Nama);
		write(f, ' | ');
		write(f, bahanOlahan[i].Harga);
		write(f, ' | ');
		write(f, bahanOlahan[i].N);
		for j := 1 to bahanOlahan[i].N do begin
			write(f, ' | ');
			write(f, bahanOlahan[i].TabBahan[j]);
		end;
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// Has been tested !
	assign(f, 'InventoriBahanMentah.txt');
	rewrite(f);
	i := 1;
	while not((inventoriMentah[i].Nama = '') and (inventoriMentah[i].Tanggal.Hari = 0) and (inventoriMentah[i].Jumlah = 0)) do begin
		write(f, inventoriMentah[i].Nama);
		write(f, ' | ');
		write(f, inventoriMentah[i].Tanggal.Hari);
		write(f, '/');
		write(f, inventoriMentah[i].Tanggal.Bulan);
		write(f, '/');
		write(f, inventoriMentah[i].Tanggal.Tahun);
		write(f, ' | ');
		write(f, inventoriMentah[i].Jumlah);
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// Has been tested !
	assign(f, 'InventoriBahanOlahan.txt');
	rewrite(f);
	i := 1;
	while not((inventoriOlahan[i].Nama = '') and (inventoriOlahan[i].Tanggal.Hari = 0) and (inventoriOlahan[i].Jumlah = 0)) do begin
		write(f, inventoriOlahan[i].Nama);
		write(f, ' | ');
		write(f, inventoriOlahan[i].Tanggal.Hari);
		write(f, '/');
		write(f, inventoriOlahan[i].Tanggal.Bulan);
		write(f, '/');
		write(f, inventoriOlahan[i].Tanggal.Tahun);
		write(f, ' | ');
		write(f, inventoriOlahan[i].Jumlah);
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// Has been tested !
	assign(f, 'Resep.txt');
	rewrite(f);
	i := 1;
	while not((resep[i].Nama = '') and (resep[i].Harga = 0) and (resep[i].N = 0)) do begin
		write(f, resep[i].Nama);
		write(f, ' | ');
		write(f, resep[i].Harga);
		write(f, ' | ');
		write(f, resep[i].N);
		for j := 1 to resep[i].N do begin
			write(f, ' | ');
			write(f, resep[i].TabBOlahan[j]);
		end;
		i := i + 1;
		writeln(f);
	end;
	close(f);
	
	// Has been tested !
	assign(f, 'Simulasi.txt');
	rewrite(f);
	i := 1;
	while not((simulasi[i].Nomor = 0) and (simulasi[i].Tanggal.Hari = 0) and (simulasi[i].HariHidup = 0)) do begin
		write(f, simulasi[i].Nomor);
		write(f, ' | ');
		write(f, simulasi[i].Tanggal.Hari);
		write(f, '/');
		write(f, simulasi[i].Tanggal.Bulan);
		write(f, '/');
		write(f, simulasi[i].Tanggal.Tahun);
		write(f, ' | ');
		write(f, simulasi[i].HariHidup);
		write(f, ' | ');
		write(f, simulasi[i].Energi);
		write(f, ' | ');
		write(f, simulasi[i].KInventori);
		write(f, ' | ');
		write(f, simulasi[i].TotalBMentah);
		write(f, ' | ');
		write(f, simulasi[i].TotalBOBuat);
		write(f, ' | ');
		write(f, simulasi[i].TotalBOJual);
		write(f, ' | ');
		write(f, simulasi[i].TotalResepJual);
		write(f, ' | ');
		write(f, simulasi[i].TotalPemasukan);
		write(f, ' | ');
		write(f, simulasi[i].TotalPengeluaran);
		write(f, ' | ');
		write(f, simulasi[i].TotalUang);
		i := i + 1;
		writeln(f);
	end;
	close(f);
end;
