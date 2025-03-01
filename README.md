# histconv

convert unixtimestamp in `.bash_history` to datetime format.

## Usage
```shell
# basic usage
$ cat history_sample
#1159804232
ls -l
#1159810201
exit

$ ./histconv.bash history_sample
2006-10-03 00:50:32 ls -l
2006-10-03 02:30:01 exit


# Input file
$ ./histconv.bash ~/.bash_history

# Redirect
$ ./histconv.bash < ~/.bash_history

# Pipeline
$ cat ~/.bash_history | ./histconv.bash

# Here document
$ ./histconv.bash <<EOF
#1159810201
ls
#1159821001
exit
EOF
```
