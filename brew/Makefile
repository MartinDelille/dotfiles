default: r

r:
	brew leaves > leaves.txt
	grep -vxFf brew.txt leaves.txt > remove.txt
	cat remove.txt

u:
	brew uninstall `cat remove.txt`
