🧬 Gene Expression Time-Series Analysis
Longitudinal characterization of transcriptional dynamics in lung cancer
A reproducible R-based workflow for investigating how selected genes change across 20 longitudinal sampling points in lung cancer expression data.
Rather than treating gene expression as a static measurement, this analysis focuses on the temporal trajectory of transcriptional activity, allowing expression patterns to be examined as dynamic biological processes.
---
🔬 Research Focus
The workflow isolates cancer-phenotype samples from publicly available GEO-derived expression data and follows the temporal behavior of four target genes:
HOPX
SPARCL1
TFF1
APOB
The analysis transforms a multi-sample expression matrix into a longitudinal representation of gene activity and produces publication-ready visualizations of expression trajectories.
Core question
> **How does the expression of selected genes evolve across the longitudinal sampling period in lung cancer samples?**
This makes the repository useful as a template for exploratory longitudinal transcriptomic analysis beyond the specific dataset used here.
---
🧪 Analytical Workflow
```text
Expression Matrix
       │
       ▼
Sample Metadata
       │
       ▼
Cancer-Phenotype Filtering
       │
       ▼
Temporal Sample Ordering
       │
       ▼
Target-Gene Extraction
       │
       ▼
Data Reshaping
       │
       ▼
Longitudinal Expression Profiles
       │
       ▼
Publication-Ready Visualization
```
---
📊 Analysis Outputs
The workflow generates continuous overlapping area plots using `ggplot2` to visualize expression trajectories across time.
The resulting figure is exported as a vector PDF:
`TimeSeries_Area_Graphs.pdf`
Vector output preserves resolution for downstream use in manuscripts, presentations, and scientific figures.
---
📁 Repository Structure
```text
gene-expression-timeseries-lungcancer/
│
├── area_graph_analysis.R
│
├── gene_expressions.csv
├── metadata.csv
├── Genes.txt
│
└── TimeSeries_Area_Graphs.pdf
```
Input data
File	Purpose
`gene_expressions.csv`	Gene × sample expression matrix
`metadata.csv`	Sample accession, phenotype, and temporal metadata
`Genes.txt`	Target gene panel
Outputs
File	Purpose
`TimeSeries_Area_Graphs.pdf`	Publication-ready longitudinal expression visualization
---
🛠️ Technology
R
`ggplot2`
`reshape2`
`dplyr`
---
🚀 Reproducibility
Install the required packages:
```r
install.packages(c("ggplot2", "reshape2", "dplyr"))
```
Place the input files in the working directory and execute:
```bash
Rscript area_graph_analysis.R
```
The workflow produces the final visualization automatically.
---
🧠 Why This Repository?
This project demonstrates an approach to time-aware transcriptomic analysis, where biological interpretation is based not only on expression magnitude but also on how expression changes across a defined temporal series.
The workflow can be adapted to:
longitudinal cancer datasets
treatment-response studies
disease progression studies
developmental expression profiles
multi-timepoint transcriptomic experiments
---
📌 Scope & Interpretation
The visualization describes expression dynamics within the analyzed cohort. Temporal association should not be interpreted as evidence of causality, and downstream biological conclusions require appropriate statistical and experimental validation.
---
👤 Author
Zaveeba Muzaffar
Biochemistry · Molecular Biology · Computational Biology
> Building reproducible computational workflows at the intersection of molecular biology, bioinformatics, and biochemical research.
