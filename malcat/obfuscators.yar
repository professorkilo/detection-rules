rule Eazfuscator_String_Encryption : suspicious {
    meta:
        name        = "Eazfuscator"
        category    = "obfuscation"
        description = "Eazfuscator.NET string encryption"
        author      = "Jonathan Peters"
        created     = "2024-01-01"
        reliability = 90
        tlp         = "TLP:white"
        sample      = "3a9ee09ed965e3aee677043ba42c7fdbece0150ef9d1382c518b4b96bbd0e442"
	 strings:
		 $sa1 = "StackFrame" ascii 
		 $sa2 = "StackTrace" ascii
		 $sa3 = "Enter" ascii
		 $sa4 = "Exit" ascii

		 $op1 = { 11 ?? 18 91 11 ?? 1? 91 1F 10 62 60 11 ?? 1? 91 1E 62 60 11 ?? 17 91 1F 18 62 60 }
		 $op2 = { D1 28 ?? 00 00 0A 0? 1F 10 63 D1 }
		 $op3 = { 7B ?? 00 00 04 16 91 02 7B ?? 00 00 04 17 91 1E 62 60 02 7B ?? 00 00 04 18 91 1F 10 62 60 02 7B ?? 00 00 04 19 91 1F 18 62 60 }
	 condition:
		 uint16(0) == 0x5a4d
		 and all of ($sa*)
		 and 2 of ($op*)
}