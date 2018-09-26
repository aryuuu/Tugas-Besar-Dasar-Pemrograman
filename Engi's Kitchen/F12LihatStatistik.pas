Unit F12LihatStatistik;

interface
uses uType;
procedure lihatstatistik(S:Simulasi);

implementation

procedure lihatstatistik(S:Simulasi);
begin
	writeln('Statistik Simulasi');
	writeln('Tanggal ', S.Tanggal.Hari, '/', S.Tanggal.Bulan, '/', S.Tanggal.Tahun);
	writeln('Nomor simulasi ', S.nomor);
	writeln('Jumlah hari hidup ',S.HariHidup);
	writeln('Jumlah energi ',S.Energi);
	writeln('Kapasitas maksimum inventori ',S.KInventori);
	writeln('Total bahan mentah dibeli ',S.TotalBMentah);
	writeln('Total bahan olahan dibuat ',S.TotalBOBuat);
	writeln('Total bahan olahan dijual ',S.TotalBOJual);
	writeln('Total resep dijual ',S.TotalResepJual);
	writeln('Total pemasukan ',S.TotalPemasukan);
	writeln('Total pengeluaran ',S.TotalPengeluaran);
	writeln('Total uang ',S.TotalUang);
end;

end.
