@echo off
echo �����ļ��ļ�����ǰ��ȷ����������ֹͣ���񡣸���Ŀ¼��D:\Mirserver����
echo Ĭ�ϸ��µ���D:\Mirserver��������������̣���ʹ������Ҽ���
echo ������ļ���Ȼ���༭���޸������·��
pause
set WSDir=G:\��쪴���\�����\MirServer
if not exist %WSDir%\LoginGateH5 md %WSDir%\LoginGateH5
if not exist %WSDir%\RunGateH5 md %WSDir%\RunGateH5
if not exist %WSDir%\SelGateH5 md %WSDir%\SelGateH5
Copy Mir200\M2Server.exe %WSDir%\Mir200\ /y
Copy Mir200\M2Server.map %WSDir%\Mir200\ /y
Copy Mir200\lua5.1.dll %WSDir%\Mir200\ /y
Copy Mir200\libtcmalloc.dll %WSDir%\Mir200\ /y
Copy Mir200\mimalloc.dll %WSDir%\Mir200\ /y
Copy Mir200\mimalloc-redirect.dll %WSDir%\Mir200\ /y
Copy Mir200\RunGate.dll %WSDir%\Mir200\ /y
Copy Mir200\Setup.json %WSDir%\Mir200\ /y
Copy Mir200\cjson.dll %WSDir%\Mir200\ /y
Copy DBServer\DBServer.exe %WSDir%\DBServer\ /y
Copy LoginGate\LoginGate.exe %WSDir%\LoginGate\ /y
Copy LoginGateH5\LoginGateH5.exe %WSDir%\LoginGateH5\ /y
Copy LoginGateH5\libcrypto-1_1.dll %WSDir%\LoginGateH5\ /y
Copy LoginGateH5\libeay32.dll %WSDir%\LoginGateH5\ /y
Copy LoginGateH5\libssl-1_1.dll %WSDir%\LoginGateH5\ /y
Copy LoginGateH5\msvcr120.dll %WSDir%\LoginGateH5\ /y
Copy LoginGateH5\ssleay32.dll %WSDir%\LoginGateH5\ /y
Copy LoginGateH5\wslib.dll %WSDir%\LoginGateH5\ /y
Copy LoginSrv\hmacsh1.dll %WSDir%\LoginSrv\ /y
Copy LoginSrv\libeay32.dll %WSDir%\LoginSrv\ /y
Copy LoginSrv\LoginSrv.exe %WSDir%\LoginSrv\ /y
Copy RunGate\RunGate.exe %WSDir%\RunGate\ /y
Copy RunGate\RunGate.dll %WSDir%\RunGate\ /y
Copy RunGateH5\RunGateH5.exe %WSDir%\RunGateH5\ /y
Copy RunGateH5\libcrypto-1_1.dll %WSDir%\RunGateH5\ /y
Copy RunGateH5\libeay32.dll %WSDir%\RunGateH5\ /y
Copy RunGateH5\libssl-1_1.dll %WSDir%\RunGateH5\ /y
Copy RunGateH5\msvcr120.dll %WSDir%\RunGateH5\ /y
Copy RunGateH5\ssleay32.dll %WSDir%\RunGateH5\ /y
Copy RunGateH5\wslib.dll %WSDir%\RunGateH5\ /y
Copy SelGate\SelGate.exe %WSDir%\SelGate\ /y
Copy SelGateH5\SelGateH5.exe %WSDir%\SelGateH5\ /y
Copy SelGateH5\libcrypto-1_1.dll %WSDir%\SelGateH5\ /y
Copy SelGateH5\libeay32.dll %WSDir%\SelGateH5\ /y
Copy SelGateH5\libssl-1_1.dll %WSDir%\SelGateH5\ /y
Copy SelGateH5\msvcr120.dll %WSDir%\SelGateH5\ /y
Copy SelGateH5\ssleay32.dll %WSDir%\SelGateH5\ /y
Copy SelGateH5\wslib.dll %WSDir%\SelGateH5\ /y
Copy GameCenter.exe %WSDir%\ /y
Copy 996M2��������ĵ�.chm %WSDir%\ /y
echo �����ļ��ļ��Ѹ������. . .
pause