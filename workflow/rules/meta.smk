# Combine per-dataset DEGs WITHIN a (condition x tissue) stratum.
# Robust Rank Aggregation (default) or random-effects (metafor).
rule meta:
<<<<<<< HEAD
    input:
        expand("results/deg/{dataset}.deg.tsv",
               dataset=DATASETS)

    output:
        "results/meta/{stratum}.meta.tsv"

    params:
        method=config["meta"]["method"],
        minds=config["meta"]["min_datasets"]

    conda:
        "../../envs/meta.yaml"

    resources:
        mem_mb=3000

    log:
        "results/logs/meta_{stratum}.log"

=======
    input: lambda wc: expand("results/deg/{dataset}.deg.tsv",
                             dataset=[d for d in DATASETS])  # TODO: filter to this stratum
    output: "results/meta/{stratum}.meta.tsv"
    params: method=config["meta"]["method"], minds=config["meta"]["min_datasets"]
    conda: "../../envs/meta.yaml"
    resources: mem_mb=3000
    log: "results/logs/meta_{stratum}.log"
>>>>>>> bc771fbb3e52813646a1d5c06ed14314e7696a3c
    shell:
        r"""
        Rscript workflow/scripts/meta_combine.R --stratum {wildcards.stratum} \
            --method {params.method} --min_datasets {params.minds} \
            --deg_dir results/deg --samplesheet {config[samplesheet]} \
            --out {output} > {log} 2>&1
        """
<<<<<<< HEAD
    
=======
>>>>>>> bc771fbb3e52813646a1d5c06ed14314e7696a3c
