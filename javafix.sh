#!/data/data/com.termux/files/usr/bin/bash



echo -e "\e[34mInstalling Java"
echo
echo

echo -e "\e[32mGive Some Time To Install Java 8!"

#Checking for existing Java installation
if [ -e $PREFIX/bin/java ]
then
	echo -e "\e[32mJava is already installed!"
	echo
	exit
else
	#Checking, whether is someone trying to cheat and simplyfy their installation it on Linux (i.e. x86 (not listad, as you can see) machine) using this script, which have no reason to work.
	case `dpkg --print-architecture` in
	aarch64)
		archname="aarch64"; tag="java_aarch" ;;
	arm64)
		archname="aarch64"; tag="java_aarch" ;;
	armhf)
		archname="arm"; tag="java" ;;
	armv7l)
		archname="arm"; tag="java" ;;
	arm)
		archname="arm"; tag="java" ;;
	*)
		tt "\e[91mERROR: Unknown architecture."; echo; exit ;;
	esac
 clear

	# Java installation
	echo -e "\e[32m[*] \e[34mDownloading Java 8 For Termux ( required 80mb ) ${archname} 	"
        wget https://github.com/h4ck3r0/Java-termux/releases/download/${tag}/jdk8_${archname}.tar.gz -q

	echo -e "\e[32m[*] \e[34mMoving JDK to system..."
	mv jdk8_${archname}.tar.gz $PREFIX/share

	echo -e "\e[32m[*] \e[34mExtracting JDK..."
	cd $PREFIX/share
	tar -xhf jdk8_${archname}.tar.gz

	echo -e "\e[32m[*] \e[34mSeting-up %JAVA_HOME%..."
	export JAVA_HOME=$PREFIX/share/jdk8
	echo "export JAVA_HOME=$PREFIX/share/jdk8" >> $HOME/.profile

	echo -e "\e[32m[*] \e[34mCoping Java wrapper scripts to bin..."
	#I'm not 100% sure, but getting rid of bin contnent MAY cause some issues with %JAVA_HOME%, thus it's no longer moved - copied instead. Sorry to everyone short on storage.
	cp bin/* $PREFIX/bin

	echo -e "\e[32m[*] \e[34mCleaning up temporary files..."
	rm -rf $HOME/installjava
	rm -rf $PREFIX/share/jdk8_${archname}.tar.gz
	rm -rf $PREFIX/share/bin

	echo
	echo -e "\e[32mJava was successfully installed!\e[39m"
 echo
 echo
 echo
 termux-open-url https://h4ck3r.me/
 echo

fi


