unit F17upgradeInventori;

interface
uses uType;
procedure upgradeInventori(var sim : Simulasi; var olahan : TBahanOlahan; var mentah : TBahanMentah; var invOlah : TInventori; var invMentah : TInventori);	

implementation

procedure upgradeInventori(var sim : Simulasi; var olahan : TBahanOlahan; var mentah : TBahanMentah;
 var invOlah : TInventori; var invMentah : TInventori);
	const
		biaya = 3000;
	var
		jawab: char;
		i:integer;
begin
	writeln('Untuk melakukan upgrade anda akan dikenakan biaya ',biaya);
	writeln('Upgrade kapasitas inventori?(y/n)');
	readln(jawab);
	if ((jawab = 'y') or (jawab = 'Y')) then 
		begin
			if (sim.TotalUang >= biaya) then 
			begin
				sim.KInventori := sim.KInventori + 25;
				for i := sim.KInventori -24 to sim.KInventori do
					begin
						olahan[i].Nama := 'kosong';
						mentah[i].Nama := 'kosong';
						invOlah[i].Nama := 'kosong';
						invMentah[i].Nama := 'kosong';
					end;
				
				sim.TotalPengeluaran := sim.TotalPengeluaran + biaya;
				sim.TotalUang := sim.TotalUang - biaya;
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

end.
