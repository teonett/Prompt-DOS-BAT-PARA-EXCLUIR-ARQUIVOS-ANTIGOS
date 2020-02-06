

@echo off

cd "c:\up\"

echo ****************************************
echo * Fase 1 exclusão 10 dias aquivo .txt *
echo ****************************************

FORFILES /D -10 /M *.txt /c "cmd /c del @file | echo @file foi excluido"

cd "c:\temp2\"

echo ****************************************
echo * Fase 2 exclusão todos aquivos   *
echo ****************************************

FORFILES /D -0 /M *.* /c "cmd /c del @file | echo @file foi excluido"

cd "c:\temp3\"

echo ****************************************
echo * Fase 3 exclusão todos aquivos  *
echo ****************************************

FORFILES /D -20 /M *.* /c "cmd /c del @file | echo @file foi excluido"

cd "c:\temp4\"

echo ****************************************
echo * Fase 4 exclusão todos aquivos   *
echo ****************************************

FORFILES /D -0 /M *.txt /c "cmd /c del /f @file | echo @file foi excluido"

FORFILES /D -0 /M *.xml /c "cmd /c del /f @file | echo @file foi excluido"

cd "c:\temp5\"

echo ****************************************
echo * Fase 5 exclusão todos aquivo   *
echo ****************************************

FORFILES /D -0 /M *.txt /c "cmd /c del /f @file | echo @file foi excluido"

FORFILES /D -0 /M *.xml /c "cmd /c del /f @file | echo @file foi excluido"

echo ******************************
echo * Fase 5 exclusão diretorios e subdiretorios*
echo ****************************************
forfiles -p "C:\what\ever" -s -m *.* /D -<number of days> /C "cmd /c del @path"


echo ********************************************************************
echo * Fase 6 exclusão e criação de Path (mapeamento de drive) *
echo  ********************************************************************

net use N: /DELETE /YES

net use N: \\172.16.60.62\Backup\Oracle


************************************************************************


@echo off

E:

cd "E:\oraarch\conv"
echo *********************************************************
echo * Fase 1 exclusão 1 dia - todos os arquivos - ARCHIVES *
echo *********************************************************

FORFILES /D -1 /M *.arc /c "cmd /c del @file | echo @file foi excluido"

net use N: /DELETE /YES

net use N: \\172.16.60.62\Backup\Oracle



N:

cd "N:\oraarch\conv"

echo ***********************************
echo * Fase 2 mover 1 dias aquivo .arc *
echo ***********************************

forfiles /m *.arc /d -1 /c "cmd /c move @file \"N:\oraarch\conv1\" 

N:

cd "N:\oraarch\conv1"

echo ***********************************
echo * Fase 3 mover 2 dias aquivo .arc *
echo ***********************************

forfiles /m *.arc /d -2 /c "cmd /c move @file \"N:\oraarch\old\" 


N:

cd "N:\oraarch\conv"

echo ***********************************
echo * Fase 3 mover 2 dias aquivo .arc *
echo ***********************************

forfiles /m *.arc /d -2 /c "cmd /c move @file \"N:\oraarch\old\" 

N:

cd "N:\oraarch\old"

echo **************************************
echo * Fase 4 exclusão 5 dias aquivo .arc *
echo **************************************

FORFILES /D -5 /M *.arc /c "cmd /c del @file | echo @file foi excluido"








