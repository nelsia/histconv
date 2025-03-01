# histconv

convert unixtimestamp in `.bash_history` to datetime format.

```shell
# input file
$ ./histconv.bash ~/.bash_history

# redirect
$ ./histconv.bash < ~/.bash_history

# pipeline
$ cat ~/.bash_history | ./histconv.bash

# here document
$ ./histconv.bash <<EOF
#1159810201
ls
#1159821001
exit
EOF
```
