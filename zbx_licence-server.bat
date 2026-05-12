@echo off

:: VERIFICA OS USUÁRIOS CONECTADOS AO SERVIDOR DE LICENÇAS E GERA UM RELATÓRIO EM CSV

set "linhas=0"
setlocal enabledelayedexpansion

"C:\Program Files (x86)\CSoft AS\CSoftAS License Server\lmutil" lmstat -a | findstr "start" > status_lic.txt
for /f %%i in ('find /c /v "" ^< "status_lic.txt"') do set "linhas=%%i"

del relatorio.csv

echo user;hostname;conection> relatorio.csv

:: O 'tokens=1,2,11' pega a 1ª palavra (user), 2ª (pc) e 11ª (hora)
for /f "tokens=1,2,8,9,10" %%a in (status_lic.txt) do (
::    echo %%a              %%b           %%c
	echo %%a;%%b;%%c %%d %%e >> relatorio.csv
)

echo %linhas%