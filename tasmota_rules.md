# Tasmota Rules for Drill Test Rig

Copy and paste these rules into the Tasmota Console.

## Rule 1: Cycle Management
Handles the On/Off timers and cycle counting.
- `Mem1`: On-time (s)
- `Mem2`: Off-time (s)
- `Mem3`: Run Status (1=Start, 0=Stop)
- `Mem4`: Cycle Counter

```tasmota
Rule1
  ON Mem3#State=1 DO Backlog Power1 1; RuleTimer1 %mem1% ENDON
  ON Rules#Timer=1 DO Backlog Power1 0; RuleTimer2 %mem2% ENDON
  ON Rules#Timer=2 DO Backlog ADD4 1; Power1 1; RuleTimer1 %mem1% ENDON
  ON Mem3#State=0 DO Backlog Power1 0; RuleTimer1 0; RuleTimer2 0 ENDON
```

## Rule 2: Safety Watchdog & Peak Tracking
- `Mem5`: Power Limit (Watts)
- `Mem6`: Peak Power (Watts)

```tasmota
Rule2
  ON Energy#Power>%mem5% DO Backlog Power1 0; Mem3 0; RuleTimer1 0; RuleTimer2 0; Event Trip=1 ENDON
  ON Energy#Power>%mem6% DO Mem6 %value% ENDON
```

## Activation Commands
Paste these to enable the rules:
```tasmota
Rule1 1
Rule2 1
SetOption0 0  -- Disable SaveData on power toggle (prevents flash wear)
SetOption26 1 -- Use Tasmota decimal separator
```

## Reset Command
To clear statistics:
```tasmota
Backlog Mem4 0; Mem6 0
```
