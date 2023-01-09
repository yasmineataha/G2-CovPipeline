# G2-CovPipeline
Master student project under IKIM-Essen

This is Group 2's attempt on creating a Covid Variants pipeline

## Running the pipeline
This section covers how to run the pipeline for

### 1) Install Snakemake
- [Install Snakemake] (https://snakemake.readthedocs.io/en/stable/getting_started/installation.html)

### 2) Get Data
- Run retreive_data.py (do it only when you have access to c45)
    ```
    python retreive_data.py
    ```

- Run get_reference.sh
    ```
    sh get_reference.sh
    ```
### 3) Run with snakemake 
- activate snakemake first
    ```
    conda activate snakemake
    ```

- enter workflow dir
    ```
    cd workflow
    ```

- run workflow dir
    ```
    snakemake --use-conda --cores 1
    ```







# Resources
[Variant Calling Tutorial] (https://datacarpentry.org/wrangling-genomics/)

