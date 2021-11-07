# Artix_Padavan
HowTo: Build Padavan firmware with Artix host systems (or Arch Linux)

1. Following packages are needed for building Padavan firmware on Artix / Arch Linux:
	make, gcc, which, autoconf, automake, pkgconf, patch, bison, flex, cmake, rpcsvc-proto, gperf, python, intltool, re2c, gtk-doc, ziopp, unzip, wget, fakeroot and cpio

	For generating/editing Artix-specific patches installing of package diffutils can be helpful. If you are working with Artix or 
	Arch Linux on wsl2/Windows, I recommend to install the nano package or to use a smart(!) text editor on Windows (e.g. Notepad++) for editing files.

2. Clone Alexey's Padavan-ng repo in your HOME directory.
  	
	$ cd $HOME 
	
	$ git clone https://gitlab.com/dm38/padavan-ng
	
	(This padavan repo is much more up-to-date than the "original" padavan repo, which has not been updated since 2 years now. Even more up-to-date is this repo:
   https://gitlab.com/mahtabctg/padavan-ng/ , but has a size of 3.6GB, compared to Alexey's repo of 97MB.)
   
3. Clone this repo into your HOME directory:
	
	$ git clone https://github.com/st-ty1/Artix_Padavan

4. Start building process with script build_padavan.sh of this repo; the script build_padavan.sh considers the patches included in this repo. Some of the source files have to be patched to work on Artix/Arch Linux. These patches are needed as, e.g.:
   - Arch Linux/Artix use more recent versions of applications which are needed for building process. (acuatlly challenging: update to autoconf-2.70)
   - Arch Linux/Artix based systems depends much more on shared libraries than other Linux-sytems, like Debian or Ubuntu, so building tools
     like libtool and pkgconfig are more likely misdirected by presence of shared libs of host-OS and will fail.

BR

st-ty1/\_st_ty/st_ty_
