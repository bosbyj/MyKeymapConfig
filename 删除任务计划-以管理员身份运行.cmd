@echo off
setlocal

rem ����Ҫɾ������������
set "taskName=MyKeymapStartupTask"

rem �������ɾ��ǰ��״̬
schtasks /query /tn "%taskName%" >nul 2>&1
if %errorlevel% neq 0 (
    echo δ�ҵ����� "%taskName%"��
    goto :end
)

echo ���� "%taskName%" ���ڣ����ڳ���ɾ��...

rem ����ɾ������
schtasks /delete /tn "%taskName%" /f >nul 2>&1

rem �������ɾ�����״̬
schtasks /query /tn "%taskName%" >nul 2>&1
if %errorlevel% neq 0 (
    echo ���� "%taskName%" �ѳɹ�ɾ����
) else (
    echo ���棺���� "%taskName%" ɾ��ʧ�ܡ�
    echo ��ȷ������ʹ�ù���Ա������д˽ű���
)

:end
endlocal
pause
