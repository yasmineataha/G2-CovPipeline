# Configuring G2-CovPipeline
This markdown will provide an insight on configuring the pipeline


## pipeline structure
```
├── workflow
│   ├── rules
|   │   ├── rules.smk
│   ├── envs
|   │   ├── tools.yaml
|   └── Snakefile
├── config
│   ├── config.yaml
├── data
|   ├── reference
|   │   ├── reference.fasta
|   ├── sampleName_R1_001.fastq
|   ├── sampleName_R2_001.fastq
```




## config.yaml
Note: Only paired ends!!!!

- Samples:
    List of the name of samples to be processed. It will be stored under data/

- Reference genome:
    The ID of the reference genome. It shjould be stored under data/reference/

- adapter:
    The adapter sequence. We do not use fasta fail. If needs to be changed simply replace the sequence in the config file

- rule parameters:
    For every rule (except what is in preprocess.smk) there are parameteres that are tuneable