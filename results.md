# Results

## Aerodynamic/load screening

| Condition | q [Pa] | Cn | Control force [N] | Hinge moment [N·m] | Horn force [N] |
|---|---:|---:|---:|---:|---:|
| 30 m/s, 10° | 551.25 | 0.7128 | 17.68 | 0.530 | 13.26 |
| 50 m/s, 25° | 1531.25 | 1.7820 | 122.79 | 3.684 | 92.09 |

With the 1.5 structural load factor, the maximum screened case gives a **322.33 N design hinge reaction**.

## Analytical sizing

| Check | Result |
|---|---:|
| Pin double-shear stress | 1.474 MPa |
| Lug bearing stress | 1.518 MPa |
| Lug net-section stress | 1.006 MPa |
| Bracket bearing stress | 0.546 MPa |
| Nominal pin von Mises stress with bending | 21.632 MPa |
| Nominal pin FoS | 46.20 |

The low basic shear/bearing stresses indicate that pin bending, local bearing/contact transfer and geometric concentration are more informative than a pure double-shear check for comparison with FEA.

## SolidWorks FEA

| Result | Value |
|---|---:|
| Local peak von Mises stress | 35.730 MPa |
| Maximum resultant displacement | 0.3716 mm |
| Maximum equivalent strain | 3.0840 × 10⁻⁴ |
| Minimum reported FoS | 14.08 |
| Screening target FoS | 3.00 |

## Analytical vs FEA

The FEA local peak is **1.65×** the nominal analytical pin von Mises stress.

This difference is physically plausible for the modelling hierarchy used here. The analytical model smooths the load path into idealized beam/shear relationships. FEA resolves local load transfer and stress concentration near the hinge/contact region.

The result is therefore best presented as:

> The analytical model provides conservative/transparent preliminary sizing at nominal-stress level, while FEA identifies the local peak stress and deformation of the detailed load path.

The FEA result remains well above the project screening FoS target for the investigated static load case.
