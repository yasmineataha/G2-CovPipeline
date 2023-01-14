rule seqtk_seq_fastq_to_fasta:
    input:
        "results/trimmed/{sample}_1.trimmed.fastq",
    output:
        "results/lineage_assignment/{sample}.merged.fasta",
    log:
        "logs/seqtk_seq_fastq_to_fasta/{sample}.log",
    params:
        extra="-a",
    wrapper:
        "v1.21.2/bio/seqtk/seq"


rule pangolin_la:
    input:
        "results/lineage_assignment/{sample}.merged.fasta"
    output:
        "results/lineage_assignment/{sample}.csv"
    conda:
        "../envs/pangolin.yaml"
    shell:
        "pangolin {input} --outfile {output}"