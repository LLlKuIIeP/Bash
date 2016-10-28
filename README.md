<h1 align="center">Bash</h1>

Компиляция и запуск
```
#!/bin/bash
echo "Start script"

echo "Start compile"
make
result_comlile=$?

if (( $result_comlile == 0 ))
	then
	echo "Start programm: $1"
	./$1
fi
```
