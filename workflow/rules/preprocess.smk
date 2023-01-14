rule trimming:
    input:
        first = "data/{sample}_R1_001.fastq",
        second = "data/{sample}_R2_001.fastq"
    output:
        first = "results/trimmed/{sample}_1.trimmed.fastq",
        second = "results/trimmed/{sample}_2.trimmed.fastq",
        merged = "results/merged/{sample}.merged.fastq",
        html_report = "workflow/report/{sample}/{sample}_report.html",
        json_report = "workflow/report/{sample}/{sample}_report.json",
    conda:
        "../envs/fastp.yaml"
    shell:
        "fastp -i {input.first} -I {input.second} -o {output.first} -O {output.second} "
        "--merge --merged_out {output.merged} -h {output.html_report} -j {output.json_report} " 
        "--adapter_sequence {read_1_adapter} --adapter_sequence_r2 {read_2_adapter} "
        "--cut_right --cut_right_window_size 4 --cut_right_mean_quality 20"
