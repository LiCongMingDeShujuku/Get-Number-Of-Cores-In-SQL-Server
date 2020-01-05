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
