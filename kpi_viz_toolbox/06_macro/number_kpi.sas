/*** HELP START ***//*

Macro: number_kpi

Purpose:
  Draw a basic horizontal bullet KPI chart using PROC GKPI (HBULLET).
  Intended for count/number-type indicators.

Parameters:
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

Usage Example:
  %number_kpi(actual=82, bounds=0 50 100 150 200 250, target=150,
              label=Number of completed Main programs);

*//*** HELP END ***/

%macro number_kpi(
actual = 96,
bounds = 0 50 100 150 200,
target=  ,
label = Number of xxxxxx
);
goptions reset=all device=javaimg xpixels=210 ypixels=110;
proc gkpi mode=basic;
hbullet actual=&actual. bounds=(&bounds.) /
%if %length(&target.) ne  0 %then %do;
   target= &target.
%end;
   label="&label.";
run;
quit;
%mend;
