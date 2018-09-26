Unit F15CariResep;
interface
uses uType,sysutils,math;
procedure cariResep(listResep:TResep);

implementation
procedure cariResep(listResep:TResep);
var
	i, j : integer;
	flag : boolean;
	listResepDicari : string;
begin
	write('Nama Resep: ');
	readln(listResepDicari);
	// Has been tested
	i := 1;
	flag := true;
	while not((listResep[i].Nama = '') and (listResep[i].Harga = 0) and (listResep[i].N = 0)) and (flag) do begin
		if (listResepDicari = listResep[i].Nama) then begin
			
			writeln('  "', listResep[i].Nama, '"');
			writeln('Resep : ');
			for j := 1 to listResep[i].N do begin
				writeln('(o) ', listResep[i].TabBOlahan[j]);
			end;
			writeln('Harga: ', listResep[i].Harga);
			flag := false;
		end;
		i := i + 1;
	end;
	if (flag) then begin
		writeln('  Resep tidak ditemukan');
	end;
end;

end.
