# Pre-Registration: Guided Self-Help Cognitive Processing Therapy (GSH CPT) Protocol

## 1. Research Question

This trial aims to assess the feasibility and efficacy of a therapist-guided CBT-based application designed to improve PTSD symptoms.
The app primarily follows the Cognitive Processing Therapy (CPT) protocol with extensions to address related areas such as panic attacks.
The study evaluates the app's accessibility, efficacy, and uptake rates compared to traditional face-to-face therapy, as well as differences between guidance from experienced versus non-experienced therapists.

---

## 2. Hypotheses

1. The app will demonstrate similar efficacy in symptom reduction compared to equivalent face-to-face CPT treatment for PTSD.
2. The app's dropout rates are expected to align with the average rates reported for guided internet-based treatments.
3. There will be no difference in treatment efficacy or uptake between experienced therapists and non-experienced therapists.

---

## 3. Research Structure

A randomized controlled trial with three arms and a total of 110 participants diagnosed with PTSD based on clinical intake and questionnaires:

1. **Active Control (n = 50):** Participants receive standard face-to-face CPT treatment for PTSD. This group includes 20 participants from historical records and 30 newly randomized participants.

2. **Expert-Guided App Therapy (n = 30):** Participants use the CPT-based app with guidance from experienced therapists who have completed at least two CPT cases and have a minimum of two years of clinical experience.

3. **Novice-Guided App Therapy (n = 30):** Participants use the CPT-based app with guidance from novice therapists who have no prior CPT experience and start in their first year of clinical practice.

Historical controls will be used to increase statistical power. Sensitivity analyses will be performed to show that they do not differ from randomized sample, and do not significantly change the outcomes.

**Randomization:** Participants will be randomized into the three arms using block randomization stratified by initial symptom severity (based on PSSI scores: low or high, with ??????
as the cutoff point).
Randomization will be conducted in R using the `blockrand` package with block sizes of 3 to ensure balance across arms while maintaining allocation concealment.

### 3.1 Inclusion and Exclusion Criteria

**Inclusion Criteria:**
- Adults (18+ years) with a primary diagnosis of PTSD as determined by the MINI International Neuropsychiatric Interview
- Ability to provide informed consent
- Access to a smartphone or tablet compatible with the study app

**Exclusion Criteria:**
- Acute suicidality (active suicidal ideation with plan and intent)
- Current psychotic symptoms or psychotic disorder
- Inability to read or understand the treatment materials
- Concurrent trauma-focused psychotherapy

### 3.2 Sample Size Justification

We performed a power analysis using Monte Carlo simulation of a Bayesian multilevel model to assess the proposed sample size.
Based on 1000 simulations with anticipated effect sizes derived from meta-analytic findings (Asmundson et al., 2018), the power analysis indicates that with our design, we have 84% power to detect non-inferiority for our primary hypothesis comparing face-to-face CPT to combined app-based interventions.
For the secondary hypothesis comparing expert vs. non-expert app guidance, power is 75%, which is adequate for this exploratory aim in a pilot study.
The analysis incorporated an ICC of 0.5 and used a non-inferiority margin of 0.5 standard deviations with a probability threshold of 0.89, and expected dropout rate of 20% for all conditions.
The full report can be found in the study repository.

### 3.3 Intervention Protocols

**Face-to-Face CPT (Active Control):**
- Standard 12-16 session CPT protocol delivered by trained therapists
- Weekly 50-minute individual sessions
- Follows manualized CPT with standard worksheets and homework assignments

**App-Based Guided Self-Help CPT:**
- Follows the same CPT protocol structure as the face-to-face condition
- Delivered via micro-learning modules through a smartphone/tablet application
- Includes the same core CPT elements: psychoeducation, stuck points identification, Socratic questioning, cognitive worksheets
- Asynchronous therapist feedback on completed exercises and worksheets

### 3.4 Blinding Procedures

To minimize bias, the following blinding procedures will be implemented:

1. **Assessor Blinding:** Clinical assessors conducting the PSSI and other clinician-rated measures will be blinded to participants' treatment condition.

2. **Randomization Concealment:** The randomization sequence will be concealed from both participants and research staff until assignment.

3. **Assessment Reliability:** A random sample of 10% of all PSSI assessments will be audio-recorded (with participant consent) and scored independently by a second blinded assessor to establish inter-rater reliability. Discrepancies greater than 5 points will be resolved through consensus discussion.

---

## 4. Main Outcome Variables

### 4.1 Symptom Improvement

1. **Primary Outcome:**
   * PTSD symptoms measured by **PSSI** (clinician interview), administered at baseline and post-intervention

2. **Secondary Outcomes:**
   * Self-reported PTSD symptoms measured by **PCL-5**, administered bi-weekly during treatment and at follow-up assessments one month and six months post-intervention

3. **Exploratory Outcomes:**
   * Additional symptoms and functioning measured monthly (except for the PTCI that is measured bi-weekly):
     * **WSAS** (Work and Social Adjustment Scale)
     * **PHQ-9** (Depression)
     * **GAD-7** (General Anxiety)
     * **PTCI** (Post-Traumatic Cognitions Inventory)

### 4.2 Treatment Uptake Variables

1. **Primary Uptake Measure:**
   * **Adherence**: Defined as the number of attended scheduled sessions in face-to-face therapy and the number of completed treatment units in app-based therapy.
   * **Dropout**: Defined as attending fewer than seven sessions in face-to-face therapy and not completing the core units in app-based therapy.

2. **Exploratory Uptake Measures for App-Based Therapy:**
   * **iiPAS** (Weekly therapist-rated engagement scores)
   * Number of worksheets completed
   * **App Usage Metrics:** Number of logins, time spent in app (minutes), number of modules accessed, and number of modules revisited

3. **Exploratory Uptake Measures for Face-to-Face Therapy:**
   * Adapted **iiPAS** (Weekly therapist-rated engagement scores)
   * Session participation score (therapist-rated 1-7 scale)

---

## 5. Operational Hypotheses

1. The app-based therapy will demonstrate comparable efficacy to face-to-face CPT in terms of:
   * Symptom change (PTSD, related symptoms, and well-being) from pre- to post-treatment and pre-treatment to follow-up
   * Rates of reliably changed participants (primary outcome: PTSD symptoms via PSSI and PCL-5)
2. No significant differences in efficacy or adherence will be observed between the two app arms (expert vs. non-expert guidance)
3. Dropout rates for app arms will not differ significantly from the reported average rate for guided internet-based interventions (expected range: up to 48%; see Koelen et al. 2022)


---

## 6. Statistical Analysis Plan

### 6.1 Bayesian Analysis Framework
We will use Bayesian statistical methods for all analyses. All continuous outcome variables will be standardized according to the mean and standard deviation at baseline to facilitate interpretation (z-scores). For all analyses, we will use an intention-to-treat approach, analyzing all randomized participants regardless of protocol adherence or study completion.

### 6.2 Symptom Improvement Models

#### Model Specification
We will use a Bayesian multilevel piecewise growth model to analyze changes in symptoms across the intervention period and at follow-up. This model will be used for all outcome measures, with follow-up parameters applied when relevant.

The primary outcome model is specified as:

\begin{align}
y_{it} &= (b_{1,\text{condition}} + u_{1i}) \\
       &+ (b_{2,\text{condition}} + u_{2i}) \cdot \min(t, t_{\text{max}}) \\
       &+ (b_{3,\text{condition}} + u_{3i}) \cdot 1_{\{t=\text{fu1}\}} \\
       &+ (b_{4,\text{condition}} + u_{4i}) \cdot 1_{\{t=\text{fu2}\}} \\
       &+ G \cdot \gamma
\end{align}

Where:
- $y_{it}$ represents the outcome score for participant $i$ at time $t$
- $t$ represents the measurement occasion in days from baseline (0 is baseline)
- $t_{\text{max}}$ represents the final treatment time point
- $\min(t, t_{\text{max}})$ captures the intervention phase progression, capped at the maximum treatment duration
- $1_{\{t=\text{fu1}\}}$ is an indicator function equal to 1 at the first follow-up assessment and 0 otherwise
- $1_{\{t=\text{fu2}\}}$ is an indicator function equal to 1 at the second follow-up assessment and 0 otherwise
- $b_{1,\text{condition}}$ represents condition-specific baseline levels of symptoms
- $b_{2,\text{condition}}$ represents condition-specific rates of symptom change during the active intervention phase
- $b_{3,\text{condition}}$ represents condition-specific additional changes at the first follow-up assessment
- $b_{4,\text{condition}}$ represents condition-specific additional changes at the second follow-up assessment
- $u_{1i}$, $u_{2i}$, $u_{3i}$ and $u_{4i}$ represent participant-specific random effects for individual variation
- $G$ represents a contrast-coded gender variable ($\pm0.5$ for female/male)
- $\gamma$ represents the effect of gender on symptom levels across all time points

The model structure captures three distinct change processes: during treatment and at two follow-up points.

#### Implementation Details
The model will be fitted using the brms package in R (version 2.19.0 or later), which implements Bayesian multilevel models using Stan.

We will use the following specifications:
- Family: Gaussian with identity link
- MCMC settings: 4 chains, 4000 iterations per chain with 2000 warm-up iterations
- Adaptive delta parameter set to 0.95 to improve sampling efficiency

#### Prior Distributions
We will use weakly informative priors to provide regularization while allowing the data to drive parameter estimation:
- Condition-specific intercepts: Normal(0, 1)
- Intervention phase slopes: Normal(0, 0.5)
- Follow-up effects: Normal(0, 0.3)
- Gender effect: Normal(0, 0.3)
- Random effect standard deviations: Exponential(1)
- Random effect correlation matrix: LKJ(2)
- Residual error: Exponential(1)

These priors are centered on theoretically plausible values for standardized symptom changes while allowing sufficient uncertainty to avoid constraining the results.

### 6.3 Treatment Uptake and Engagement Models

#### Model Specification
We will use a Bayesian Weibull survival model to analyze time-to-dropout across the intervention period.
This model will be used to compare retention rates between treatment conditions while accounting for baseline symptom severity.

The primary uptake model is specified as:

\begin{align}
\text{time}_i &\sim \text{Weibull}(\lambda_i, k_i) \\
\log(\lambda_i) &= b_{1,\text{condition}} \\
  &+ b_{2,\text{condition}} \cdot \text{PCL-}z_i \\
  &+ u_{i} \\
\log(k_i) &= \gamma_{1,\text{condition}}
\end{align}

Where:
- $\text{time}_i$ represents the time-to-dropout for participant $i$ (in days from baseline)
- $\lambda_i$ represents the scale parameter of the Weibull distribution for participant $i$
- $k_i$ represents the shape parameter of the Weibull distribution for participant $i$
- $b_{1,\text{condition}}$ represents condition-specific intercepts for the scale parameter
- $b_{2,\text{condition}}$ represents condition-specific effects of baseline symptom severity
- $\text{PCL-}z_i$ represents the baseline PCL-5 score for participant $i$, standardized to z-scores
- $u_i$ represents participant-specific random effects allowing for individual variation
- $\gamma_{1,\text{condition}}$ represents condition-specific shape parameters

The model accounts for right-censoring for participants who complete the full intervention.

#### Implementation Details
The model will be fitted using the brms package in R (version 2.19.0 or later), which implements Bayesian survival models using Stan.

We will use the following specifications:
- Family: Weibull with log link for both scale and shape parameters
- MCMC settings: 4 chains, 3000 iterations per chain with 1000 warm-up iterations
- Random effects: Participant-level random intercepts

#### Prior Distributions
We will use weakly informative priors to provide regularization while allowing the data to drive parameter estimation:
- Condition-specific scale intercepts: Normal(0, 2)
- Condition-specific PCL-5 effects: Normal(0, 1)
- Condition-specific shape parameters: Normal(0, 2)
- Random effect standard deviations: Exponential(1)

These priors reflect plausible ranges for hazard ratios while allowing sufficient uncertainty to avoid constraining the results.

# 6.4 Statistical Procedures

## 6.4.1 Model Diagnostics and Validation
We will assess model convergence using R-hat statistics (target < 1.01) and effective sample sizes (target > 400 per parameter).
Posterior predictive checks will be used to evaluate model fit and identify potential areas of model misspecification.

## 6.4.2 Hypotheses Testing
Primary hypotheses regarding non-inferiority will be evaluated using posterior distributions and Region of Practical Equivalence (ROPE) analysis.

For each non-inferiority hypothesis, we will report:
1. The posterior mean difference between conditions and its 89% credible interval
2. The percentage of the posterior distribution falling within the ROPE
3. The probability that the experimental condition is not inferior to the reference condition

We define our ROPE as [-0.2, 0.2] standard deviations of the outcome measure.
This represents the range of differences between conditions that are considered clinically negligible.

Non-inferiority will be concluded if at least 89% of the posterior distribution of the difference between conditions falls above the lower bound of the ROPE (-0.2).

## 6.4.3 Missing Data Handling
Bayesian methods naturally handle missing data through the joint modeling of observed and missing values.
For all analyses, we will assume data are missing at random (MAR).
This is reasonable given that we are always controlling for baseline severity.

## 6.4.4 Software Implementation
All analyses will be conducted in R (version 4.2.0 or later) using the following packages:
- `brms` (version 2.18.0 or later) for Bayesian regression models
- `bayesplot` (version 1.9.0 or later) for visualization of posterior distributions
- `tidybayes` (version 3.0.0 or later) for handling and summarizing posterior samples
- `loo` (version 2.5.0 or later) for model comparison via leave-one-out cross-validation
