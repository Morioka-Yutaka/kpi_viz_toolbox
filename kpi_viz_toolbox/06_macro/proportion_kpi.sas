/*** HELP START ***//*

Macro: proportion_kpi

Purpose:
  Draw a basic speedometer KPI chart using PROC GKPI (SPEEDOMETER).
  Intended for proportion/ratio-type indicators.

Parameters:
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

Usage Example:
  %proportion_kpi(actual=0.22, bounds=0 0.25 0.5 0.75 1, target=0.5,
                  label=Proportion of Compare match);

*//*** HELP END ***/

%macro proportion_kpi(
actual = 0.25,
bounds = 0 0.25 0.5 0.75 1,
target=  ,
label = Proportion of xxxxxx
);
goptions reset=all device=javaimg xpixels=210 ypixels=200;
proc gkpi mode=basic;
speedometer actual=&actual. bounds=(&bounds.) /
    %if %length(&target.) ne  0 %then %do;
       target= &target.
    %end;
   label="&label."
   format="percent8.";
run; 
quit;
%mend;
