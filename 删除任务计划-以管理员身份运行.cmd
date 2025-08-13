@echo off
setlocal

rem 设置要删除的任务名称
set "taskName=MyKeymapStartupTask"

rem 检查任务删除前的状态
schtasks /query /tn "%taskName%" >nul 2>&1
if %errorlevel% neq 0 (
    echo 未找到任务 "%taskName%"。
    goto :end
)

echo 任务 "%taskName%" 存在，正在尝试删除...

rem 尝试删除任务
schtasks /delete /tn "%taskName%" /f >nul 2>&1

rem 检查任务删除后的状态
schtasks /query /tn "%taskName%" >nul 2>&1
if %errorlevel% neq 0 (
    echo 任务 "%taskName%" 已成功删除。
) else (
    echo 警告：任务 "%taskName%" 删除失败。
    echo 请确认您已使用管理员身份运行此脚本。
)

:end
endlocal
pause
