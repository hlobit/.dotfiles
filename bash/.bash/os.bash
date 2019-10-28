if [ "$OSTYPE" = "linux-gnu" ]; then
  export OS='linux'
elif [ "$OSTYPE" = "darwin"* ]; then
  export OS='osx'
elif [ "$OSTYPE" = "cygwin" ]; then
  export OS='windows'
elif [ "$OSTYPE" = "msys" ]; then
  export OS='windows'
elif [ "$OSTYPE" = "win32" ]; then
  export OS='windows'
elif [ "$OSTYPE" = "freebsd"* ]; then
  export OS='bsd'
else
  export OS='unknown'
fi
