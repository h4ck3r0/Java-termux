#!/$PREFIX/bin/sh
pkg install unzip
echo '

       ██  █████  ██    ██  █████  
       ██ ██   ██ ██    ██ ██   ██ 
       ██ ███████ ██    ██ ███████ 
  ██   ██ ██   ██  ██  ██  ██   ██ 
   █████  ██   ██   ████   ██   ██ 
       github.com/h4ck3r0/Java-termux 
                             Openjdk8
         
  ' | lolcat

                               
cd $HOME/Java-termux
cp -r jdk8 $PREFIX/share/
cd $PREFIX/share/jdk8/jre/lib/
unzip rt.zip
cat << 'EOL' >> $PREFIX/bin/java

#!/usr/bin/bash
unset LD_PRELOAD
export JAVA_HOME="$PREFIX/share/jdk8"
export LIB_DIR="\$PREFIX/share/glib"
export LD_LIBRARY_PATH="\$LIB_DIR"
exec proot -0 \$JAVA_HOME/bin/java "\$@"

EOL

