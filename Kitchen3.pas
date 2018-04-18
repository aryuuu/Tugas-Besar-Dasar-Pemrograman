program Kitchen3;
uses sysutils, uType;

type 
	arrInt = array[1..NMax] of Integer;
	arrStr = array[1..NMax] of string;
var
	DaftarBOlahan	: TBahanOlahan;
	DaftarResep		: TResep;
	DaftarSimulasi	: TSimulasi;
	noSimulasi		: Integer;
	InventoriOlahan : TInventori;
	InventoriMentah	: TInventori;
	i,j,k : integer;


//FUNGSI PENDUKUNG
	function isCukupEnergi(sim : TSimulasi; energiButuh: Integer): Boolean;
	begin
		if (sim[noSimulasi].Energi >= energiButuh) then 
		begin
			isCukupEnergi := True;
		end
		else 
		begin
			isCukupEnergi := False;
		end;
	end;

	function hargaOlahan(namaOlahan : string; olahan : TBahanOlahan): Longint;
	begin
		i := 1;
		while (namaOlahan <> TBahanOlahan[i].Nama) do
		begin
			i := i + 1;
		end;
		hargaOlahan := TBahanOlahan[i].Harga;
	end;


//END OF FUNGSI PENDUKUNG


	procedure F7jualOlahan(var invOlahan : TInventori ;var sim : TSimulasi ;var olahan: TBahanOlahan);
	var
		jml: Integer;
		jwb : char;
		nomorbahan : integer;
		
		
	begin
		if (isCukupEnergi(DaftarSimulasi,1) = true) then 
			begin
				writeln('Daftar Nama Bahan Olahan 	:');
				for i := 1 to sim[noSimulasi].KInventori do
				begin
					writeln(i , '. ', invOlahan[i].Nama, ' tersisa 	: ', invOlahan[i].Jumlah);
				end;

				write('Masukkan nomor bahan yang ingin anda jual 	: ');
				readln(nomorbahan);

				if (invOlahan[nomorbahan].Jumlah > 0 ) then 
					begin
						write('Masukkan jumlah bahan yang ingin dijual	: ');
						readln(jml);

						if ((jml <= invOlahan[nomorbahan].Jumlah) and (jml > 0)) then 
						begin
							writeln('Jual bahan?(y/n)');
							readln(jwb);
							if ((jwb = 'y') or (jwb = 'Y')) then 
							begin
								invOlahan[nomorbahan].Jumlah := invOlahan[nomorbahan].Jumlah - jml;
								sim[noSimulasi].TotalUang := sim[noSimulasi].TotalUang + hargaOlahan(invOlahan[nomorbahan].Nama, olahan) ;
								sim[noSimulasi].TotalPemasukan := sim[noSimulasi].TotalPemasukan + hargaOlahan(invOlahan[nomorbahan].Nama, olahan) ;
								sim[noSimulasi].Energi := sim[noSimulasi].Energi - 1;
								writeln('Penjualan bahan berhasil dilakukan.');
							end
							else if ((jwb = 'n') or (jwb = 'N')) then
							begin
								writeln('Penjualan bahan dibatalkan.');
							end;

						end
						else 
						begin
							writeln('Mohon periksa kembali jumlah barang yang ingin anda jual.');
						end;




					end
				else 
					begin
						writeln('Habis :(');
					end;



			end
		else 
			begin
				writeln('Tidak cukup energi :(');
			end;



		
	end;

	procedure F8jualResep(var invMentah : TInventori;var invOlahan : TInventori; var sim : TSimulasi; resep : TResep);
	var
		sOlahan, sMentah : Boolean;
		jwb : char;
		nomorresep, bahanTersedia, jOlahan, jMentah: integer;
		dnOlahan, dnMentah : array[1..NMax] of integer;
	begin
		if (isCukupEnergi(sim,1) = true) then 
		begin
			i := 1;
			while(resep[i].Nama <> '') do
			begin
				writeln(i, '. ',resep[i].Nama);
				i := i + 1;
			end;

			write('Silahkan masukkan nomor resep yang ingin Anda jual 	: ');
			readln(nomorresep);

			bahanTersedia := 0;
			jOlahan := 0;
			jMentah := 0;

			for i := 1 to resep[nomorresep].N do
			begin
				for j := 1 to sim[noSimulasi].KInventori do
				begin
					if ((resep[nomorresep].TabBOlahan[i] = invOlahan[j].Nama) and (invOlahan[j].Jumlah > 0)) then
					begin
						sOlahan := false;

						if (j > 1) then
						begin
							for k := 1 to j-1 do
							begin
								if (invOlahan[k].Nama = invOlahan[j].Nama) then //memeriksa apakah bahan sudah pernah ditambahkan sebelumnya
								begin 											//karena pada inventori terdapat beberapa bahan yang sama dengan tanggal kadaluarsa yang berbeda
									sOlahan := true;
								end;
							end;							
						end;


						if (sOlahan = false) then
						begin
							bahanTersedia := bahanTersedia + 1;
							jOlahan := jOlahan + 1;
							dnOlahan[jOlahan] := j;							
						end;

					end;

					if ((resep[nomorresep].TabBOlahan[i] = invMentah[j].Nama) and (invMentah[j].Jumlah > 0)) then
					begin
						sMentah := false;

						if (j > 1) then
						begin
							for k := 1 to j-1 do
							begin
								if (invMentah[k].Nama = invMentah[j].Nama) then //memeriksa apakah bahan sudah pernah ditambahkan sebelumnya
								begin 											//karena pada inventori terdapat beberapa bahan yang sama dengan tanggal kadaluarsa yang berbeda
									sMentah := true;
								end;
							end;							
						end;


						if (sMentah = false) then
						begin
							bahanTersedia := bahanTersedia + 1;
							jMentah := jMentah + 1;
							dnMentah[jMentah] := j;							
						end;					
					end;
				end;
			end;

			if (bahanTersedia = resep[nomorresep].N) then 
			begin
				for i := 1 to jOlahan do
				begin
					invOlahan[dnOlahan[i]].Jumlah := invOlahan[dnOlahan[i]].Jumlah - 1;
				end;
				for i := 1 to jMentah do
				begin
					invMentah[dnMentah[i]].Jumlah := invMentah[dnMentah[i]].Jumlah - 1;
				end;

				sim[noSimulasi].TotalResepJual := sim[noSimulasi].TotalResepJual + 1;
				sim[noSimulasi].TotalPemasukan := sim[noSimulasi].TotalPemasukan + resep[nomorresep].Harga;
				sim[noSimulasi].TotalUang := sim[noSimulasi].TotalUang + resep[nomorresep].Harga;
				sim[noSimulasi].Energi := sim[noSimulasi].Energi - 1;



				writeln('Resep berhasil dijual!');





			end
			else 
			begin
				writeln('Maaf bahan yang Anda miliki tidak cukup untuk membuat resep ini :(');
			end;



			
		end
		else 
		begin
			writeln('Tidak cukup energi :(');
		end;
		
	end;

	procedure F17upgradeInventori(var sim : TSimulasi; var olahan : TBahanOlahan; var mentah : TBahanMentah; var invOlah : TInventori; var invMentah : TInventori);
	const
		biaya = 3000;
	var
		jawab: char;
		

	begin

	writeln('Untuk melakukan upgrade anda akan dikenakan biaya ',biaya);
	writeln('Upgrade kapasitas inventori?(y/n)');
	readln(jawab);
	if ((jawab = 'y') or (jawab = 'Y')) then 
		begin
			if (sim[noSimulasi].TotalUang >= biaya) then 
			begin
				sim[noSimulasi].KInventori := sim[noSimulasi].KInventori + 25;
				for i := sim[noSimulasi].KInventori -24 to sim[noSimulasi].KInventori do
					begin
						olahan[i].Nama := 'kosong';
						mentah[i].Nama := 'kosong';
						invOlah[i].Nama := 'kosong';
						invMentah[i].Nama := 'kosong';
					end;
				
				sim[noSimulasi].TotalPengeluaran := sim[noSimulasi].TotalPengeluaran + biaya;
				sim[noSimulasi].TotalUang := sim[noSimulasi].TotalUang - biaya;
				writeln('Inventori berhasil di upgrade!');
			end
			else 
			begin
				writeln('Maaf, sisa uang anda tidak cukup untuk melakukan upgrade :(');
			end;

		end
	else if ((jawab = 'n') or (jawab = 'N')) then
		begin
			writeln('Upgrade inventori dibatalkan ');
		end;
		
	end;












	
begin




	{}
end.

