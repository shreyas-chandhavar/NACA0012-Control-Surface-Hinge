# Aerodynamic / SU2 Notes

The project used NACA0012 as the reference aerodynamic section and included a lightweight 2-D SU2 check as part of the aerodynamic workflow.

The public SU2 documentation itself uses NACA0012 as a standard 2-D tutorial/reference geometry, making it a suitable non-proprietary basis for this portfolio study.

## Important reproducibility note

The original completed SU2 configuration, mesh, and coefficient-history files were not available in the current workspace when this GitHub package was generated.

For that reason this folder contains **no fabricated `.cfg`, `.su2`, or solver-output files**.

Before publishing a fully reproducible CFD section, add the original files here, for example:

```text
SU2_case/
├── case.cfg
├── mesh.su2
├── history.csv
└── surface_flow.csv
```

Then document the exact velocity/Mach number, Reynolds number or viscosity model, angle of attack, control-surface geometry/deflection, mesh size, solver type, convergence criterion, and final coefficients.

Reference:
SU2 NACA0012 Quick Start: https://su2code.github.io/docs_v7/Quick-Start/
