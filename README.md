![CLEVER DATA GIT REPO](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/0-clever-data-github.png "李聪明的数据库")

# 获取SQL Server中的内核数量
#### Get Number Of Cores In SQL Server
**发布-日期: 2016年10月18日 (评论)**

## Contents

- [中文](#中文)
- [English](#English)
- [SQL Logic](#Logic)
- [Build Info](#Build-Info)
- [Author](#Author)
- [License](#License) 


## 中文
你有时需要访问许可证，为此，你需要针对sys.dm_os_sys_info运行一些查询，以便获取SQL Server的核心数量。

如果你想要sys.dm_os_sys_info上的所有信息，请访问：https：/msdn.microsoft.com/en-us/library/ms175048（v = sql.110）.aspx

这里有一些快速的SQL逻辑可以帮助你入门。



## English
From time to time you’ll need to visit your license costs, and to do so you’ll need to run some queries against sys.dm_os_sys_info so you can get the number of cores for SQL Server.
If you want all the dirt on sys.dm_os_sys_info just go here: https://msdn.microsoft.com/en-us/library/ms175048(v=sql.110).aspx
Here’s some quick SQL Logic to get you started.


![#](images/Get-Number-Of-Cores-In-SQL-Server-01.png?raw=true "#")


---
## Logic
```SQL
use master;
set nocount on
select
     'physical_cpu' = cpu_count / hyperthread_ratio
,    'cores' =
         case
            when hyperthread_ratio = cpu_count then cpu_count
            else (cpu_count / hyperthread_ratio) * ((cpu_count - hyperthread_ratio) / (cpu_count / hyperthread_ratio))
         end
,     'logical_cpu' =
          case
             when hyperthread_ratio = cpu_count then cpu_count
          else ((cpu_count - hyperthread_ratio) / (cpu_count / hyperthread_ratio))
       end
from
    master.sys.dm_os_sys_info


```
当然，如果你对逻辑感到好奇，并且需要一种简单的方法来验证可以使用性能监视器快速浏览一下的话，只需右键单击任务栏，然后单击“任务管理器”。查看右下角，你将看到核心数和逻辑处理器数。

Of course; if you’re curious about the logic, and need a simple way to verify you can always get a quick glance from basically using performance monitor. Just right-click the task-bar, and click ‘Task Manager’. If you look at the lower right you’ll see the number of cores and the number of logical processors.

![#](images/Get-Number-Of-Cores-In-SQL-Server-02.png?raw=true "#")


[![WorksEveryTime](https://forthebadge.com/images/badges/60-percent-of-the-time-works-every-time.svg)](https://shitday.de/)

## Build-Info

| Build Quality | Build History |
|--|--|
|<table><tr><td>[![Build-Status](https://ci.appveyor.com/api/projects/status/pjxh5g91jpbh7t84?svg?style=flat-square)](#)</td></tr><tr><td>[![Coverage](https://coveralls.io/repos/github/tygerbytes/ResourceFitness/badge.svg?style=flat-square)](#)</td></tr><tr><td>[![Nuget](https://img.shields.io/nuget/v/TW.Resfit.Core.svg?style=flat-square)](#)</td></tr></table>|<table><tr><td>[![Build history](https://buildstats.info/appveyor/chart/tygerbytes/resourcefitness)](#)</td></tr></table>|

## Author

- **李聪明的数据库 Lee's Clever Data**
- **Mike的数据库宝典 Mikes Database Collection**
- **李聪明的数据库** "Lee Songming"

[![Gist](https://img.shields.io/badge/Gist-李聪明的数据库-<COLOR>.svg)](https://gist.github.com/congmingshuju)
[![Twitter](https://img.shields.io/badge/Twitter-mike的数据库宝典-<COLOR>.svg)](https://twitter.com/mikesdatawork?lang=en)
[![Wordpress](https://img.shields.io/badge/Wordpress-mike的数据库宝典-<COLOR>.svg)](https://mikesdatawork.wordpress.com/)

---
## License
[![LicenseCCSA](https://img.shields.io/badge/License-CreativeCommonsSA-<COLOR>.svg)](https://creativecommons.org/share-your-work/licensing-types-examples/)

![Lee Songming](https://raw.githubusercontent.com/LiCongMingDeShujuku/git-resources/master/1-clever-data-github.png "李聪明的数据库")

