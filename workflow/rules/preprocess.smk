rule trimming:
    input:
        first = "data/{sample}_R1_001.fastq",
        second = "data/{sample}_R2_001.fastq"
    output:
        first = "results/trimmed/{sample}_1.trimmed.fastq",
        second = "results/trimmed/{sample}_2.trimmed.fastq",
        html_report = "workflow/report/{sample}/{sample}_report.html",
        json_report = "workflow/report/{sample}/{sample}_report.json",
    conda:
        "../envs/fastp.yaml"
    shell:
        "fastp -i {input.first} -I {input.second} -o {output.first} -O {output.second} -h {output.html_report} -j {output.json_report} --detect_adapter_for_pe"