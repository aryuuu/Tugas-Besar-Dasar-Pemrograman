unit F7jualOlahan;

interface
uses uK3,uType;

procedure jualOlahan(var invOlahan : TInventori ;var sim : TSimulasi ;var olahan: TBahanOlahan);

implementation

procedure jualOlahan(var invOlahan : TInventori ;var sim : TSimulasi ;var olahan: TBahanOlahan);
	var
		i: Integer;
		jml: Integer;
		jwb : char;
		nomorbahan : integer;
		
		
begin
	writeln(noSimulasi);
	if (isCukupEnergi(sim,1) = true) then 
			begin
				writeln('Daftar Nama Bahan Olahan 	:');
				for i := 1 to sim[noSimulasi].KInventori do
				begin
					writeln(i , '. ', invOlahan[i].Nama, ' tersisa 	: ', invOlahan[i].Jumlah);
				end;

				write('Masukkan nomor bahan yang ingin anda jual 	: ');
				readln(nomorbahan);

				if ((invOlahan[nomorbahan].Jumlah > 0) and (invOlahan[nomorbahan].Nama <> 'kosong') ) then 
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

end.
