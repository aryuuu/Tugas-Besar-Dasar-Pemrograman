unit F16TambahResep;

interface
uses
	uType,sysutils,math;

function isFoundInventori(namaBahan : string; inventori : TInventori) : boolean;

function harga(namaBahan : string; listBahanOlahan : TBahanOlahan; listBahanMentah : TBahanMentah) : longint;

procedure validasiResep(var listResep: TResep; resepBaru : Resep; listInventoriMentah : TInventori; listInventoriOlahan: TInventori;listBahanOlahan: TBahanOlahan;listBahanMentah:TBahanMentah);

procedure tambahresep(var sim : TSimulasi; var resep : TResep; listInventoriMentah : TInventori; listInventoriOlahan: TInventori;listBahanOlahan: TBahanOlahan;listBahanMentah:TBahanMentah);


implementation

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

function harga(namaBahan : string; listBahanOlahan : TBahanOlahan; listBahanMentah : TBahanMentah) : longint;
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

procedure validasiResep(var listResep: TResep; resepBaru : Resep; listInventoriMentah : TInventori; listInventoriOlahan: TInventori;listBahanOlahan: TBahanOlahan;listBahanMentah:TBahanMentah);
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
			for i := 1 to resepBaru.N do begin  //namaBahan : string; listBahanOlahan : TBahanOlahan; listBahanMentah : TBahanMentah
				hargaResep := hargaResep + harga(resepBaru.TabBOlahan[i],listBahanOlahan,listBahanMentah);
			end;
			hargaBanding := ceil(1.125 * hargaResep);
			if (resepBaru.Harga > hargaBanding) then begin
				i := 1;
				while not(listResep[i].Nama = '') do begin
					i := i + 1;
				end;
				
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

procedure tambahresep(var sim : TSimulasi; var resep : TResep; listInventoriMentah : TInventori; listInventoriOlahan: TInventori;listBahanOlahan: TBahanOlahan;listBahanMentah:TBahanMentah);
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
	
	validasiResep(resep,resepBaru,listInventoriMentah,listInventoriOlahan,listBahanOlahan,listBahanMentah);
	writeln('Resep berhasil ditambahkan!');
end;//listResep: TResep; resepBaru : Resep; listInventoriMentah : TInventori; listInventoriOlahan: TInventori;listBahanOlahan: TBahanOlahan;listBahanMentah:TBahanMentah);

end.
