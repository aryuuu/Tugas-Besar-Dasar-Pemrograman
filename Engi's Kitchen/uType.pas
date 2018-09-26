unit uType;

interface
const
	NMax = 100;

type 
	BahanMentah = record
		Nama 	: string;
		Harga	: Longint;
		Durasi	: Integer; 
		
	end;

	TBahan = array[1..NMax] of string;

	BahanOlahan = record
		Nama 	: string;
		Harga	: longint;
		N 		: Integer;
		TabBahan: TBahan;

	end;

	Date = record
		Hari 	: Integer;
		Bulan	: integer;
		Tahun	: integer;
		
	end;

	Inventori = record
		Nama	: string;
		Tanggal	: Date;
		Jumlah	: Integer;
		
	end;

	TabBahanOlahan = array[1..NMax] of string;

	Resep = record
		Nama		: String;
		Harga		: longint;
		N 			: Integer;
		TabBOlahan	: TabBahanOlahan;
	
	end;

	TBahanMentah = array[1..NMax] of BahanMentah;
	TBahanOlahan = array[1..NMax] of BahanOlahan;
	TInventori = array[1..NMax] of Inventori;
	TResep = array[1..NMax] of Resep;

	Simulasi = record
		Nomor 			: Integer;
		Tanggal			: Date;
		HariHidup		: Integer;
		Energi			: Integer;
		KInventori		: Integer;
		TotalBMentah	: Integer;
		TotalBOBuat		: Integer;
		TotalBOJual		: Integer;
		TotalResepJual	: Integer;
		TotalPemasukan	: Integer;
		TotalPengeluaran: Integer;
		TotalUang		: Integer;
		
	end;
	TSimulasi = array[1..Nmax] of Simulasi;


implementation

end.
