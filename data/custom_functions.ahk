; 自定义的函数写在这个文件里,  然后能在 MyKeymap 中调用

; 使用如下写法，来加载当前目录下的其他 AutoHotKey v2 脚本
; #Include ../data/test.ahk

sendSomeChinese() {
  Send("{text}你好中文!")
}

sendEnye() {
  if !GetKeyState("Shift", "P") {  ; 如果Shift未按下
    SendInput "{ASC 0241}"       ; 发送ñ字符
  } else {
    SendInput "{ASC 0209}"       ; 发送ñ字符
  }
}