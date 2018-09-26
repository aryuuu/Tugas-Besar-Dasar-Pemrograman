unit F8jualResep;

interface
uses uK3,uType;
procedure jualResep(var invMentah : TInventori;var invOlahan : TInventori; var sim : TSimulasi; resep : TResep);

implementation	
	
procedure jualResep(var invMentah : TInventori;var invOlahan : TInventori; var sim : TSimulasi; resep : TResep);
	var
		sOlahan, sMentah : Boolean;
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

end.
