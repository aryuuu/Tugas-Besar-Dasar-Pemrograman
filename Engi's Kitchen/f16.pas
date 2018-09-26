function isFoundInventori(namaBahan : string; inventori : TInventori) : boolean;
var
	i : integer;
begin
	i := 1;
	isFoundInventori := false;
	while not((inventori[i].Nama = '') and (inventori[i].Tanggal.Hari = 0) and (inventori[i].Jumlah = 0)) and not(isFoundInventori) do begin
		if (namaBahan = inventori[i].Nama) then begin
			isFoundInventori := true;
		end;
		i := i + 1;
	end;
end;
function harga(namaBahan : string) : longint;
var
	i : integer;
begin
	i := 1;
	while not(listBahanOlahan[i].Nama = '') or not(listBahanMentah[i].Nama = '') do begin
		if (namaBahan = listBahanOlahan[i].Nama) then begin
			harga := listBahanOlahan[i].Harga;
			break;
		end;
		if (namaBahan = listBahanMentah[i].Nama) then begin
			harga := listBahanMentah[i].Harga;
			break;
		end;
		i := i + 1;
	end;
end;
procedure validasiResep(resepBaru : Resep);
var
	i, j : integer;
	flag : boolean;
	hargaResep, hargaBanding : longint;
begin
	if (resepBaru.N > 1) then begin
		i := 1;
		flag := true;
		while (i <= resepBaru.N) and (flag) do begin
			if not(isFoundInventori(resepBaru.TabBOlahan[i], listInventoriMentah) or isFoundInventori(resepBaru.TabBOlahan[i], listInventoriOlahan)) then begin
				flag := false;
			end;
			i := i + 1;
		end;
		if not(flag) then begin
			writeln('Maaf, bahan tidak tersedia di inventori');
		end else begin
			hargaResep := 0;
			for i := 1 to resepBaru.N do begin
				hargaResep := hargaResep + harga(resepBaru.TabBOlahan[i]);
			end;
			hargaBanding := ceil(1.125 * hargaResep);
			if (resepBaru.Harga > hargaBanding) then begin
				i := 1;
				while not(listResep[i].Nama = '') do begin
					i := i + 1;
				end;
				writeln(i);
				listResep[i].Nama := resepBaru.Nama;
				listResep[i].Harga := resepBaru.Harga;
				listResep[i].N := resepBaru.N;
				for j := 1 to resepBaru.N do begin
					listResep[i].TabBOlahan[j] := resepBaru.TabBOlahan[j];
				end;
			end else begin
				writeln('Maaf, harga harus lebih besar 12,5% dari harga bahan');
			end;
		end;	
	end else begin
		writeln('Maaf, bahan harus lebih dari satu');
	end;
end;
procedure F16tambahResep(var sim : TSimulasi; var resep : TResep);
var
	resepBaru : Resep;
	i : integer;
begin
	write('Nama resep: ');
	readln(resepBaru.Nama);
	write('Harga jual: ');
	readln(resepBaru.Harga);
	write('Banyak bahan: ');
	readln(resepBaru.N);
	for i := 1 to resepBaru.N do begin
		write('Bahan-', i, ': ');
		readln(resepBaru.TabBOlahan[i]);
	end;
	validasiResep(resepBaru);
end;