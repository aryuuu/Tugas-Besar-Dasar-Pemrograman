unit F4stopSimulasi;
interface
uses uType,F12LihatStatistik;
procedure stopSimulasi(simulasiPilihan : Simulasi);

implementation
procedure stopSimulasi(simulasiPilihan : Simulasi);
begin
	writeln('Simulasi dihentikan');
	writeln();
	writeln('Statistik Simulasi');
	lihatstatistik(simulasiPilihan);
end;

end.
