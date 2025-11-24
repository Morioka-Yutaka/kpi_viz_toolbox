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

If you paste the generated figures into Teams or Slack and add a brief comment on your interpretation, that alone should greatly improve shared understanding and team awareness of the overall status.

---
 
## `%number_kpi()` macro <a name="numberkpi-macro-1"></a> ######
### Purpose:  
  Draw a basic horizontal bullet KPI chart using PROC GKPI (HBULLET).  
  Intended for count/number-type indicators.  
  
Parameters:  
~~~text
  actual   = Numeric value representing the current performance.
             Default: 96
  bounds   = Space-delimited numeric breakpoints for the bullet ranges.
             Values must be in ascending order.
             Default: 0 50 100 150 200
  target   = (Optional) Numeric target value to display as a marker.
             If blank, the TARGET option is not applied.
             Default: blank
  label    = Text label displayed on the KPI chart.
             Default: Number of xxxxxx
~~~

### Usage Example:
~~~sas
  %number_kpi(actual=82, bounds=0 50 100 150 200 250, target=150,
              label=Number of completed Main programs);
~~~

<img width="396" height="196" alt="image" src="https://github.com/user-attachments/assets/1017d883-d95d-4f92-92f0-6a90921f7f56" />  

---

## `%proportion_kpi()` macro <a name="proportionkpi-macro-2"></a> ######
### Purpose:  
  Draw a basic speedometer KPI chart using PROC GKPI (SPEEDOMETER).  
  Intended for proportion/ratio-type indicators.  
  
### Parameters:  
~~~text
  actual   = Numeric value representing the current performance,
             typically between 0 and 1 when using percent format.
             Default: 0.25
  bounds   = Space-delimited numeric breakpoints for the gauge ranges.
             Values must be in ascending order (commonly 0 to 1).
             Default: 0 0.25 0.5 0.75 1
  target   = (Optional) Numeric target value to display as a marker.
             If blank, the TARGET option is not applied.
             Default: blank
  label    = Text label displayed on the KPI chart.
             Default: Proportion of xxxxxx
~~~
### Usage Example:  
~~~sas
  %proportion_kpi(actual=0.22, bounds=0 0.25 0.5 0.75 1, target=0.5,
                  label=Proportion of Compare match);
~~~
<img width="394" height="368" alt="image" src="https://github.com/user-attachments/assets/6fc3938b-69da-4dcd-ad17-c7afb5b99b16" />  

---

## version history
0.1.0(25Nov2025): Initial version

## What is SAS Packages?

The package is built on top of **SAS Packages Framework(SPF)** developed by Bartosz Jablonski.

For more information about the framework, see [SAS Packages Framework](https://github.com/yabwon/SAS_PACKAGES).

You can also find more SAS Packages (SASPacs) in the [SAS Packages Archive(SASPAC)](https://github.com/SASPAC).

## How to use SAS Packages? (quick start)

### 1. Set-up SAS Packages Framework

First, create a directory for your packages and assign a `packages` fileref to it.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~sas
filename packages "\path\to\your\packages";
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Secondly, enable the SAS Packages Framework.
(If you don't have SAS Packages Framework installed, follow the instruction in 
[SPF documentation](https://github.com/yabwon/SAS_PACKAGES/tree/main/SPF/Documentation) 
to install SAS Packages Framework.)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~sas
%include packages(SPFinit.sas)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### 2. Install SAS package

Install SAS package you want to use with the SPF's `%installPackage()` macro.

- For packages located in **SAS Packages Archive(SASPAC)** run:
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~sas
  %installPackage(packageName)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- For packages located in **PharmaForest** run:
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~sas
  %installPackage(packageName, mirror=PharmaForest)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- For packages located at some network location run:
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~sas
  %installPackage(packageName, sourcePath=https://some/internet/location/for/packages)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  (e.g. `%installPackage(ABC, sourcePath=https://github.com/SomeRepo/ABC/raw/main/)`)


### 3. Load SAS package

Load SAS package you want to use with the SPF's `%loadPackage()` macro.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~sas
%loadPackage(packageName)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### Enjoy!
  
