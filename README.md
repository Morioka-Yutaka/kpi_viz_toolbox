# kpi_viz_toolbox
KPI visualization macros for tracking and reporting SDTM/ADaM/TLF programming progress, including counts and proportion-based indicators for delivery status.

<img width="360" height="360" alt="kpi_viz_toolbox_small" src="https://github.com/user-attachments/assets/acb85875-2389-440c-9ccf-af85edd83f26" />


## Required SAS Components:
  - SAS/Graph

## Concrete example and usage scenario
For example, suppose there is a study where we need to produce 250 TLF output tables, and the delivery deadline is 10 business days from now.  
Let’s say the leader sets targets such that by 10 business days before the deadline we should have completed 150 tables, and that 50% of the 250 tables should have reached the “compare match” stage.   
If, at the current point in time, the main side has completed 82 tables, the sub side has completed 161 tables, and the number of compare matches is 55, then the main side is significantly behind schedule, and as a result the overall situation also feels somewhat critical. But if you describe that only in text, people won’t really grasp it.

In such cases, you can use this package to draw the following:
~~~sas
%number_kpi(actual = 82,bounds = 0 50 100 150 200 250, target=150, label=Number of completed Maim programs )
%number_kpi(actual = 161,bounds = 0 50 100 150 200 250, target=150, label=Number of completed Sub programs )
%number_kpi(actual = 55,bounds = 0 50 100 150 200 250, target=100, label=Number of Compare match )
%proportion_kpi(actual = 0.22,bounds = 0 0.25 0.5 0.75 1,target= 0.5 ,label = Proportion of Compare match)
~~~

<img width="380" height="192" alt="image" src="https://github.com/user-attachments/assets/f3c4778d-2ce0-4836-9054-404b026f7b2e" />  
  
<img width="396" height="196" alt="image" src="https://github.com/user-attachments/assets/1017d883-d95d-4f92-92f0-6a90921f7f56" />  
  
<img width="398" height="196" alt="image" src="https://github.com/user-attachments/assets/2d879d9f-1018-4dc5-84b5-5df41b359582" />  
  
<img width="394" height="368" alt="image" src="https://github.com/user-attachments/assets/6fc3938b-69da-4dcd-ad17-c7afb5b99b16" />  



