# Calculate the read coverage of positions in the genome
rule bcftools_mpileup:
    input:
        alignments="results/mapped/{sample}.sorted.bam",
        ref="data/reference/" + genome + ".fasta",  # this can be left out if --no-reference is in options
        index="results/mapped/{sample}.sorted.bam.bai"
    output:
        pileup="results/pileups/{sample}.pileup.bcf",
    params:
        uncompressed_bcf=False,
    log:
        "logs/bcftools_mpileup/{sample}.log",
    wrapper:
        "v1.21.1/bio/bcftools/mpileup"

# Detect the single nucleotide variants (SNVs)
rule bcftools_call:
    input:
        pileup="results/pileups/{sample}.pileup.bcf",
    output:
        calls="results/mapped/{sample}.calls.vcf",
    params:
        caller="-m",  # valid options include -c/--consensus-caller or -m/--multiallelic-caller
        extra="--ploidy 1 -v",
    log:
        "logs/bcftools_call/{sample}.log",
    wrapper:
        "v1.21.1/bio/bcftools/call"


# Filter and report the SNV variants in variant calling format (VCF)
rule filter_vcf:
    input:
        "results/mapped/{sample}.calls.vcf"
    output:
        "results/vcf/{sample}.filtered.vcf"
    wrapper:
        "v1.21.1/bio/vcftools/filter"