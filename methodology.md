# Methodology

## 1. Aerodynamic reference geometry

The reference section is a symmetric NACA0012 profile with a 300 mm chord. The control-surface break is placed at 75% chord:

\[
x_h/c = 0.75,\qquad x_h = 225\text{ mm}
\]

The control-surface chord is therefore 75 mm. A 600 mm span is used for the screening load model, giving an area of 0.0450 m².

The supplied MATLAB coordinate generator uses the closed-trailing-edge form of the NACA four-digit thickness equation:

\[
y_t = 5tc\left(0.2969\sqrt{x/c}-0.1260(x/c)-0.3516(x/c)^2+0.2843(x/c)^3-0.1036(x/c)^4\right)
\]

Cosine spacing is used to place additional points near the leading and trailing edges.

## 2. Screening aerodynamic/control-surface model

The intent of the MATLAB model is not to replace a validated flap database. It provides a transparent screening relationship between speed, deflection, force and hinge moment.

With dynamic pressure

\[
q=\frac{1}{2}\rho V^2
\]

the screening normal-force coefficient is

\[
C_n = 2\pi\eta_\delta\delta
\]

with \(\eta_\delta=0.65\). The control-surface force is

\[
F=qSC_n
\]

and the hinge moment is approximated using an aerodynamic force arm of 40% of the 75 mm control-surface chord:

\[
M_h=F(0.40c_f)
\]

The horn force uses a 40 mm horn arm:

\[
F_{horn}=\frac{M_h}{0.040}
\]

A 1.5 load factor is then applied to the combined magnitude:

\[
R=1.5(|F|+|F_{horn}|)
\]

At 50 m/s and 25°, this gives the structural design reaction of 322.33 N.

## 3. Analytical structural model

Selected geometry:

- pin diameter: 11.8 mm
- lug hole: 12.2 mm
- lug thickness: 18 mm
- lug net-section width used in sizing: 29.6 mm
- bracket ear thickness: 25 mm per ear
- aluminum parts: 7075-T6
- pin: 17-4 PH stainless steel

Initial checks include pin double shear, lug bearing, lug net-section stress, and bracket bearing.

For the nominal pin stress used in the MATLAB/FEA comparison, the effective loaded span is estimated as

\[
L=t_{lug}+t_{ear}=43\text{ mm}
\]

and

\[
M_{max}=\frac{RL}{4}
\]

The circular-pin bending stress is

\[
\sigma_b=\frac{32M_{max}}{\pi d^3}
\]

while the double-shear stress is

\[
\tau=\frac{R}{2(\pi d^2/4)}
\]

The nominal von Mises stress is then

\[
\sigma_{VM}=\sqrt{\sigma_b^2+3\tau^2}
\]

which gives approximately 21.632 MPa.

## 4. SolidWorks CAD and FEA

The detailed hinge model contains a bracket, hinge pin, lug, control-surface structural members, and the local load path. The separate NACA0012 context assembly positions the physical hinge pin on the 75%-chord reference axis.

The final static study uses:

- 7075-T6 aluminum for the aluminum structural parts
- 17-4 PH stainless steel for the pin
- a fixed support at the hinge-bracket/base attachment
- roller/slider restraint used to stabilize the pin-end degree of freedom
- local contact definitions at pin–lug and pin–bracket interfaces
- the 322.33 N design load
- solid finite elements with local geometric refinement around contact/hole regions

The FEA model is intentionally a local static structural model rather than a full airframe/control-surface structural model.

## 5. Comparison philosophy

The analytical and FEA stresses are not expected to be identical.

The analytical result is a nominal stress estimate based on idealized pin bending and double shear. The FEA peak is a local result influenced by contact transfer, geometric discontinuities, bearing effects, and mesh resolution.

The comparison therefore evaluates whether the analytical model captures the correct order of magnitude and whether the local structural model remains comfortably above the screening factor-of-safety target.
