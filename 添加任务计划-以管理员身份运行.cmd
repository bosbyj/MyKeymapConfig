@echo off
setlocal

rem 获取批处理文件所在的目录
set "scriptDir=%~dp0"

rem 设置您的程序名称
set "programName=MyKeymap.exe"

rem 构建相对路径下的完整程序路径
set "programPath=%scriptDir%%programName%"

rem 设置任务名称
set "taskName=MyKeymapStartupTask"

rem 检查程序路径是否存在
if not exist "%programPath%" (
    echo 错误：在当前目录下找不到程序文件 "%programName%"
    echo 请确保 MyKeymap.exe 与此批处理文件在同一文件夹中。
    pause
    exit /b 1
)

rem 检查任务是否已存在，如果存在则先删除
schtasks /query /tn "%taskName%" >nul 2>&1
if %errorlevel% equ 0 (
    echo 任务 "%taskName%" 已存在，正在删除旧任务...
    schtasks /delete /tn "%taskName%" /f
)

rem 创建新的任务计划
echo 正在创建任务 "%taskName%"...

schtasks /create /tn "%taskName%" ^
 /tr "%programPath%" ^
 /sc ONLOGON ^
 /rl HIGHEST ^
 /f ^
 /v1

rem 检查任务创建结果
if %errorlevel% equ 0 (
    echo 任务 "%taskName%" 创建成功！
    echo.
    echo 请手动检查：
    echo   1. 打开“任务计划程序”
    echo   2. 任务计划程序库，找到任务 "%TASK_NAME%"
    echo   3. 右键 → 属性
    echo   4. 条件选项卡→确认“只有在使用交流电源时才启动此任务”未勾选
    echo   5. 设置选项卡→确认“如果任务运行时间超过以下时间，停止任务”未勾选
    echo.
) else (
    echo 任务创建失败。
    echo 您可能需要以管理员身份运行此脚本。
)

endlocal
pause
