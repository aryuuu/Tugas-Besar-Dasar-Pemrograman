program utama;

uses 
sysutils,uType,uK3,F1Load,F2Exit,F3startSimulasi,F4stopSimulasi,F5BeliBahan,F6OlahBahan,
F7jualOlahan,F8jualResep,F9Makan,F10Istirahat,F11Tidur,F12LihatStatistik,F13LihatInventori,
F14lihatResep,F15CariResep,F16TambahResep, F17upgradeInventori;

var
	input:string;
	vbMentah:TBahanMentah;
	vbOlahan:TBahanOlahan;
	viMentah:TInventori;
	viOlahan:TInventori;
	vResep:TResep;
	vSimulasi:TSimulasi;
	noSimulasi:integer;
	nMakan:integer;
	nIstirahat:integer;
	
{Algoritma}
begin
	input:='';
	while (input<>'exit') do
	begin
		{Menampilkan menu utama,user memasukkan pilihan input}
		writeln('Menu Utama, pilih fitur dengan mengetik (namafitur) no uppercase');
		writeln('1. load');
		writeln('2. exit');
		writeln('3. start (noSimulasi)');
		write('>');
		readln(input);
		case input of
			'load' :
			begin
				load(vbMentah,vbOlahan,viMentah,viOlahan,vResep,vSimulasi);
				writeln();
			end;
			'exit' : exit(vbMentah,vbOlahan,viMentah,viOlahan,vResep,vSimulasi);
			'start' :
			begin
				writeln('masukkan no simulasi');
				readln(noSimulasi);
				startSimulasi(noSimulasi);
				while (input <> 'stopsimulasi') do
				begin
				{memulai simulasi}
					writeln('Pilih aksi dengan mengetik (nama fitur) no uppercase');
					writeln('Lihat apa saja fitur yang tersedia dengan mengetik [daftaraksi]');	
					write('>>');
					readln(input);
					case input of
						'stop'				:stopSimulasi(vSimulasi[noSimulasi]);
						'belibahan'			:beliBahan(vbMentah,vSimulasi[noSimulasi],viMentah);
						'olahbahan'			:;
						'jualolahan'		:jualOlahan(viOlahan,vSimulasi,vbOlahan);
						'jualresep'			:jualResep(viMentah,viOlahan,vSimulasi,vResep);
						'makan'				:makan(vSimulasi[noSimulasi].Energi,nMakan);
						'istirahat'			:istirahat(vSimulasi[noSimulasi].Energi,nIstirahat);
						'tidur'				:tidur(vSimulasi[noSimulasi].tanggal,vSimulasi[noSimulasi].HariHidup,vSimulasi[noSimulasi].energi,vbMentah,viMentah,viOlahan,nIstirahat,nMakan) ;
						'lihatstatistik'	:lihatstatistik(vSimulasi[noSimulasi]);
						'lihatinventori'	:lihatinventori(viMentah,viOlahan);
						'lihatresep'		:lihatResep(vResep);
						'cariresep'			:cariResep(vResep);//var sim : TSimulasi; var resep : TResep; listInventoriMentah : TInventori; listInventoriOlahan: TInventori;listBahanOlahan: TBahanOlahan;listBahanMentah:TBahanMentah);
						'tambahresep'		:tambahresep(vSimulasi,vResep,viMentah,viOlahan,vbOlahan,vbMentah);
						'upgradeinventori'	:upgradeInventori(vSimulasi[noSimulasi],vbOlahan,vbMentah,viMentah,viOlahan);
						'daftaraksi'		:begin
												writeln('stopsimulasi');
												writeln('belibahan');
												writeln('olahbahan');
												writeln('jualolahan');
												writeln('jualresep');
												writeln('makan');
												writeln('istirahat');
												writeln('tidur');
												writeln('lihatstatistik');
												writeln('lihatresep');
												writeln('cariresep');
												writeln('tambahresep');
												writeln('upgradeinventori');
											end;	
					end;
					writeln();	
				end;
			end;
		end;
	end;
end.
