@echo off
setlocal

rem ��ȡ�������ļ����ڵ�Ŀ¼
set "scriptDir=%~dp0"

rem �������ĳ�������
set "programName=MyKeymap.exe"

rem �������·���µ���������·��
set "programPath=%scriptDir%%programName%"

rem ������������
set "taskName=MyKeymapStartupTask"

rem ������·���Ƿ����
if not exist "%programPath%" (
    echo �����ڵ�ǰĿ¼���Ҳ��������ļ� "%programName%"
    echo ��ȷ�� MyKeymap.exe ����������ļ���ͬһ�ļ����С�
    pause
    exit /b 1
)

rem ��������Ƿ��Ѵ��ڣ������������ɾ��
schtasks /query /tn "%taskName%" >nul 2>&1
if %errorlevel% equ 0 (
    echo ���� "%taskName%" �Ѵ��ڣ�����ɾ��������...
    schtasks /delete /tn "%taskName%" /f
)

rem �����µ�����ƻ�
echo ���ڴ������� "%taskName%"...

schtasks /create /tn "%taskName%" ^
 /tr "%programPath%" ^
 /sc ONLOGON ^
 /rl HIGHEST ^
 /f ^
 /v1

rem ������񴴽����
if %errorlevel% equ 0 (
    echo ���� "%taskName%" �����ɹ���
    echo.
    echo ���ֶ���飺
    echo   1. �򿪡�����ƻ�����
    echo   2. ����ƻ�����⣬�ҵ����� "%TASK_NAME%"
    echo   3. �Ҽ� �� ����
    echo   4. ����ѡ���ȷ�ϡ�ֻ����ʹ�ý�����Դʱ������������δ��ѡ
    echo   5. ����ѡ���ȷ�ϡ������������ʱ�䳬������ʱ�䣬ֹͣ����δ��ѡ
    echo.
) else (
    echo ���񴴽�ʧ�ܡ�
    echo ��������Ҫ�Թ���Ա������д˽ű���
)

endlocal
pause
