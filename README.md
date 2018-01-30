# servstart
Small script to help manage command line microservice startup scripts in multiple folders.

Add a script by running `servscript.sh set <command>`, and then run it using `servscript.sh` on the same folder.  
`-t`, `-c` and `-d` can be used to set debug, clean and test scripts.

usage: 
```./servscript.sh [ -d | --debug | -t | --test | -c | --clean ] [ delete | view | set <command> ]```
