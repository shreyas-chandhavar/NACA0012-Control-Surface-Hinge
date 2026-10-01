# Limitations and Claim Boundaries

This project is intended as an engineering portfolio study and should not be presented as certification evidence or flight-hardware substantiation.

## Aerodynamic model

The MATLAB control-surface load model uses a simplified linear normal-force relation and an assumed effectiveness factor. It is suitable for parametric screening, not as a substitute for a validated flap/control-surface aerodynamic database across stall, Reynolds-number, and viscous effects.

A lightweight SU2 study was used during the project as an aerodynamic cross-check. The exact original SU2 case files were not available when this repository package was assembled, so no solver configuration or numerical coefficient history has been invented here. Add the original case files before claiming full aerodynamic reproducibility.

## Structural model

The SolidWorks study is static and local. It does not include:

- full control-surface/airframe flexibility
- fatigue or spectrum loading
- impact or abuse loads
- bolt preload and detailed fastener joint mechanics
- manufacturing tolerances or clearance sensitivity
- nonlinear material response
- certification load cases
- full mesh-convergence documentation

The reported 35.73 MPa stress is a local finite-element peak for the investigated model. It should not be treated as a mesh-independent certification stress without convergence and modelling-sensitivity studies.

## CAD context

The NACA0012 context assembly is used to establish geometric traceability between the 75%-chord aerodynamic hinge location and the structural hinge axis.

The detailed hinge mechanism is **not** claimed to be a packaging-optimized internal installation within a 12%-thick NACA0012 section. Its purpose is to demonstrate the load path, CAD definition, and structural-analysis workflow.

## Factor of safety plot

The raw SolidWorks factor-of-safety legend can become extremely large in nearly unstressed regions because FoS is inversely related to stress. The meaningful value for this study is the reported **minimum FoS = 14.08**, not the maximum legend value.
