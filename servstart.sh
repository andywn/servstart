#!/bin/bash
SSCRIPT_HOME=~/.sscript
HASH=$(pwd | xargs md5 -qs)
if [ $# -gt 0 ] && ([ $1 == '-d' ] || [ $1 == '--debug' ])
then
    FILE=$SSCRIPT_HOME/d-$HASH.sh
    shift
elif [ $# -gt 0 ] && ([ $1 == '-t' ] || [ $1 == '--test' ])
then
    FILE=$SSCRIPT_HOME/t-$HASH.sh
    shift
elif [ $# -gt 0 ] && ([ $1 == '-c' ] || [ $1 == '--clean' ])
then
    FILE=$SSCRIPT_HOME/c-$HASH.sh
    shift
else
    FILE=$SSCRIPT_HOME/$HASH.sh
fi
if [ $# -eq 0 ]
then
    if [ -f $FILE ];
    then
        $FILE
    else
        echo 'Start script not found'
    fi
else
    if [ $1 == 'set' ]
    then
        shift
        echo "$@" > $FILE
        chmod 700 $FILE
    elif [ $1 == 'view' ]
    then
        cat $FILE
    elif [ $1 == 'delete' ]
    then
        echo "Deleting script"
        cat $FILE
        rm $FILE
    else
        echo 'usage: ./servscript.sh [ -d | --debug | -t | --test | -c | --clean ] [ delete | view | set <command> ]'
    fi
fi
