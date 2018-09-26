unit uK3;

interface
uses uType, sysutils;

var
	i,j,k: Integer;
	noSimulasi : integer;

function isCukupEnergi(sim : TSimulasi; energiButuh: Integer): Boolean;

function hargaOlahan(namaOlahan : string; olahan : TBahanOlahan): Longint;

implementation


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
		while (namaOlahan <> olahan[i].Nama) do
		begin
			i := i + 1;
		end;
		hargaOlahan := olahan[i].Harga;
	end;

end.
