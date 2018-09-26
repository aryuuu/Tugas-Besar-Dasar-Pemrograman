Unit F1Load;
interface
uses uType,sysutils,math;
procedure load(var listBahanMentah : TBahanMentah; var listBahanOlahan : TBahanOlahan; var listInventoriMentah : TInventori; var listInventoriOlahan : TInventori; var listResep : TResep; var listSimulasi : TSimulasi);

implementation
procedure load(var listBahanMentah : TBahanMentah; var listBahanOlahan : TBahanOlahan; var listInventoriMentah : TInventori; var listInventoriOlahan : TInventori; var listResep : TResep; var listSimulasi : TSimulasi);
var
	f : text;
	data : string;
	i, j, k, lenToBeCut, guard, slash : integer;
begin
	
	assign(f, 'BahanMentah.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 3 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	listBahanMentah[j].Nama := copy(data, 1, guard);
				2 : val(copy(data, 1, guard), listBahanMentah[j].Harga);
				3 : listBahanMentah[j].Durasi := strtoint(data);
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;
	close(f);
	
	//This code has been tested!
	assign(f, 'BahanOlahan.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 3 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	begin
						listBahanOlahan[j].Nama := copy(data, 1, guard);
					end;
				2 : begin
						val(copy(data, 1, guard), listBahanOlahan[j].Harga);
					end;
				3 : begin
						val(copy(data, 1, guard), listBahanOlahan[j].N);
						lenToBeCut := length(copy(data, 1, guard)) + 3;
						delete(data, 1, lenToBeCut);
						for k := 1 to listBahanOlahan[j].N do begin
							guard := pos(' | ', data) - 1;
							if (k = listBahanOlahan[j].N) then begin
								listBahanOlahan[j].TabBahan[k] := data;
							end else begin
								listBahanOlahan[j].TabBahan[k] := copy(data, 1, guard);
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
	close(f);
	
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
						listInventoriMentah[j].Nama := copy(data, 1, guard);
					end;
				2 : begin
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), listInventoriMentah[j].Tanggal.Hari);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), listInventoriMentah[j].Tanggal.Bulan);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						guard := pos(' | ', data) - 1;
						val(copy(data, 1, guard), listInventoriMentah[j].Tanggal.Tahun);
					end;
				3 : begin
						listInventoriMentah[j].jumlah := strtoint(data);
					end;
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;
	close(f);
	
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
						listInventoriOlahan[j].Nama := copy(data, 1, guard);
					end;
				2 : begin
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), listInventoriOlahan[j].Tanggal.Hari);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), listInventoriOlahan[j].Tanggal.Bulan);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						guard := pos(' | ', data) - 1;
						val(copy(data, 1, guard), listInventoriOlahan[j].Tanggal.Tahun);
					end;
				3 : begin
						listInventoriOlahan[j].jumlah := strtoint(data);
					end;
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;
	close(f);
	
	//This code has been tested!
	assign(f, 'Resep.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 3 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	listResep[j].Nama := copy(data, 1, guard);
				2 : val(copy(data, 1, guard), listResep[j].Harga);
				3 : begin
						val(copy(data, 1, guard), listResep[j].N);
						lenToBeCut := length(copy(data, 1, guard)) + 3;
						delete(data, 1, lenToBeCut);
						for k := 1 to listResep[j].N do begin
							guard := pos(' | ', data) - 1;
							if (k = listResep[j].N) then begin
								listResep[j].TabBOlahan[k] := data;
							end else begin
								listResep[j].TabBOlahan[k] := copy(data, 1, guard);
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
	close(f);
	
	//This code has been tested!
	assign(f, 'Simulasi.txt');
	reset(f);
	j := 1;
	while (not(eof(f))) do begin
		readln(f, data);
		for i := 1 to 12 do begin
			guard := pos(' | ', data) - 1;
			case i of
				1 :	val(copy(data, 1, guard), listSimulasi[j].Nomor);
				2 : begin
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), listSimulasi[j].Tanggal.Hari);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						slash := pos('/', data) - 1;
						val(copy(data, 1, slash), listSimulasi[j].Tanggal.Bulan);
						lenToBeCut := length(copy(data, 1, slash)) + 1;
						delete(data, 1, lenToBeCut);
						
						guard := pos(' | ', data) - 1;
						val(copy(data, 1, guard), listSimulasi[j].Tanggal.Tahun);
					end;
				3 : val(copy(data, 1, guard), listSimulasi[j].HariHidup);
				4 : val(copy(data, 1, guard), listSimulasi[j].Energi);
				5 : val(copy(data, 1, guard), listSimulasi[j].KInventori);
				6 : val(copy(data, 1, guard), listSimulasi[j].TotalBMentah);
				7 : val(copy(data, 1, guard), listSimulasi[j].TotalBOBuat);
				8 : val(copy(data, 1, guard), listSimulasi[j].TotalBOJual);
				9 : val(copy(data, 1, guard), listSimulasi[j].TotalResepJual);
				10 : val(copy(data, 1, guard), listSimulasi[j].TotalPemasukan);
				11 : val(copy(data, 1, guard), listSimulasi[j].TotalPengeluaran);
				12 : listSimulasi[j].TotalUang := strtoint(data);
			end;
			lenToBeCut := length(copy(data, 1, guard)) + 3;
			delete(data, 1, lenToBeCut);
		end;
		j := j + 1;
	end;
	close(f);
	
	writeln('Loading file sukses.');
end;

end.
