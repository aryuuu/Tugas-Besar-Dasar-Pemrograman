procedure F1load(var bahanMentah : TBahanMentah; var bahanOlahan : TBahanOlahan; var inventoriMentah : TInventori; var inventoriOlahan : TInventori; var resep : TResep; var simulasi : TSimulasi);
var
	f : text;
	data : string;
	i, j, k, lenToBeCut, guard : integer;

begin
	
	assign(f, 'BahanMentah.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 3 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	bahanMentah[j].Nama := copy(data, 1, guard);
				2 : val(copy(data, 1, guard), bahanMentah[j].Harga);
				3 : bahanMentah[j].Durasi := strtoint(data);
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;

	//This code has been tested!
	assign(f, 'bahanOlahan.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 3 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	begin
						bahanOlahan[j].Nama := copy(data, 1, guard);
						writeln(bahanOlahan[j].Nama);
					end;
				2 : begin
						val(copy(data, 1, guard), bahanOlahan[j].Harga);
						writeln(bahanOlahan[j].Harga);
					end;
				3 : begin
						val(copy(data, 1, guard), bahanOlahan[j].N);
						writeln(bahanOlahan[j].N);
						lenToBeCut := length(copy(data, 1, guard)) + 3;
						delete(data, 1, lenToBeCut);
						for k := 1 to bahanOlahan[j].N do begin
							guard := pos(' | ', data) - 1;
							if (k = bahanOlahan[j].N) then begin
								bahanOlahan[j].TabBahan[k] := data;
							end else begin
								bahanOlahan[j].TabBahan[k] := copy(data, 1, guard);
							end;
							lenToBeCut := length(copy(data, 1, guard)) + 3;
							delete(data, 1, lenToBeCut);
							writeln(' ', bahanOlahan[j].TabBahan[k]);
						end;
					end;
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;

	//This code has been tested!
	assign(f, 'InventoriBahanMentah.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 3 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	begin
						inventoriMentah[j].Nama := copy(data, 1, guard);
					end;
				2 : begin
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), inventoriMentah[j].Tanggal.Hari);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), inventoriMentah[j].Tanggal.Bulan);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						guard := pos(' | ', data) - 1;
						val(copy(data, 1, guard), inventoriMentah[j].Tanggal.Tahun);
					end;
				3 : begin
						inventoriMentah[j].jumlah := strtoint(data);
					end;
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;

	//This code has been tested!
	assign(f, 'InventoriBahanOlahan.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 3 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	begin
						inventoriOlahan[j].Nama := copy(data, 1, guard);
					end;
				2 : begin
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), inventoriOlahan[j].Tanggal.Hari);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), inventoriOlahan[j].Tanggal.Bulan);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						guard := pos(' | ', data) - 1;
						val(copy(data, 1, guard), inventoriOlahan[j].Tanggal.Tahun);
					end;
				3 : begin
						inventoriOlahan[j].jumlah := strtoint(data);
					end;
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;

	//This code has been tested!
	assign(f, 'Resep.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 3 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	resep[j].Nama := copy(data, 1, guard);
				2 : val(copy(data, 1, guard), resep[j].Harga);
				3 : begin
						val(copy(data, 1, guard), resep[j].N);
						lenToBeCut := length(copy(data, 1, guard)) + 3;
						delete(data, 1, lenToBeCut);
						for k := 1 to resep[j].N do begin
							guard := pos(' | ', data) - 1;
							if (k = resep[j].N) then begin
								resep[j].TabBahan[k] := data;
							end else begin
								resep[j].TabBahan[k] := copy(data, 1, guard);
							end;
							lenToBeCut := length(copy(data, 1, guard)) + 3;
							delete(data, 1, lenToBeCut);
						end;
					end;
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;

	//This code has been tested!
	assign(f, 'Simulasi.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 12 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	val(copy(data, 1, guard), simulasi[j].Nomor);
				2 : begin
						val(copy(data, 1, 2), simulasi[j].Tanggal.Hari);
						val(copy(data, 4, 2), simulasi[j].Tanggal.Bulan);
						val(copy(data, 7, 4), simulasi[j].Tanggal.Tahun);
					end;
				3 : val(copy(data, 1, guard), simulasi[j].HariHidup);
				4 : val(copy(data, 1, guard), simulasi[j].Energi);
				5 : val(copy(data, 1, guard), simulasi[j].KInventori);
				6 : val(copy(data, 1, guard), simulasi[j].TotalBMentah);
				7 : val(copy(data, 1, guard), simulasi[j].TotalBOBuat);
				8 : val(copy(data, 1, guard), simulasi[j].TotalBOJual);
				9 : val(copy(data, 1, guard), simulasi[j].TotalResepJual);
				10 : val(copy(data, 1, guard), simulasi[j].TotalPemasukan);
				11 : val(copy(data, 1, guard), simulasi[j].TotalPengeluaran);
				12 : simulasi[j].TotalUang := strtoint(data);
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;
end;
