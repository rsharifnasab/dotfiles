function hdd
	reset
    df --all -h | grep  "/dev/sda*"	
end
