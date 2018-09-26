unit uKadaluarsa;

interface
uses uType, uTambahTanggal;

	function TanggalKadaluarsaBMen(InvMentah: inventori; BahanMen: BahanMentah):Date;

	function TanggalKadaluarsaBOla(InvOlahan: inventori):Date;
implementation
	//Nyari tanggal Kadaluarsa yang bahan mentah
	function TanggalKadaluarsaBMen(InvMentah: inventori; BahanMen: BahanMentah):Date;
	var i : integer;
	begin
	  TanggalKadaluarsaBMen:=InvMentah.Tanggal;
	  if not(BahanMen.Durasi=0) then 
	  begin
		//cari durasinya
	    for i:=1 to BahanMen.Durasi do
	    begin
	      TambahTanggal(TanggalKadaluarsaBMen);
	    end;
      end;	
    end;  
	
	//Nyari tanggal Kadaluarsa yang bahan olahan
	function TanggalKadaluarsaBOla(InvOlahan: inventori):Date;
	var i : integer;
	begin
	  TanggalKadaluarsaBOla:=InvOlahan.Tanggal; 
	  //cari durasinya
	  for i:=1 to 3 do
	  begin
        TambahTanggal(TanggalKadaluarsaBOla);
      end;
	end;
	
END.

