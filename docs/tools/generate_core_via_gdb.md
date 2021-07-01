tags: [GDB core markdown]


# GDB生成Core文件的两种方法
<table>
<tr>
<th></th>
<th>gcore</th>
<th>generate-core-file</th>
</tr>
<tr>
<td>用法</td>
<td>gcore [-o filename] pid</td>
<td>
[root@htdev ~]# gdb attach 19388 
</td>
</tr>
<td>输出</td>
<td><code>
[root@htdev ~]# gcore 19388 
[Thread debugging usinglibthread_db enabled]
[New Thread 0x2b46ed999890 (LWP19388)]
[New Thread 0x43e62940 (LWP 19399)]
[New Thread 0x43461940 (LWP 19398)]
[New Thread 0x42a60940 (LWP 19397)]
[New Thread 0x4205f940 (LWP 19396)]
[New Thread 0x41018940 (LWP 19390)]
[New Thread 0x41007940 (LWP 19389)]
0x000000364b4d06d9 in syscall ()from /lib64/libc.  so.6
Saved corefile core.19388
</code></td>
<td><code>
GNU gdb Fedora (6.8-37.el5)
Copyright (C) 2008 Free SoftwareFoundation, Inc.
License GPLv3+: GNU GPL version 3or later <http://gnu.org/    licenses/gpl.html>
This is free software: you arefree to change and      redistribute it.
There is NO WARRANTY, to theextent permitted by law.  Type    "show copying"
and "show warranty" for details.
This GDB was configured as"x86_64-redhat-linux-gnu"...
attach: No such file or directory.
Attaching to process 19388
...
0x000000364b4d06d9 in syscall ()from /lib64/libc.so.6
(gdb) generate-core-file
Saved corefile core.19388
(gdb) detach
Detaching from program: /usr/localbin/node, process 19388
</code></td>
</tr>
</table>

如果core文件生成异常，可能跟ulimit设置有关。