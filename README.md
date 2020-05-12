# Genome Analysis, VT2020
Genome Analysis, VT2020 project course at Uppsala University. Bioinformatics, MSc. The aims of this course is to utilize available bioinformatic tools and cloud resources to answer a scientific question that will require computationally heavy analyses. This project will be based on a [paper](https://www.nature.com/articles/ng.3972) about the draft genome of the tropical fruit durian (*Durio zibethinus*).

## Introduction
*Durio zibethinus*, other known as Durian, is a fruit indigenous to South East Asia and bears a dense nutrient profile of impressive vitamins and mineral contents, amongst other consitutients. This species, amongst other 30 subsumed species of the genus, is the most commonly appearing and consumed in SEA. It has a very distinct aroma and some might even describe it to be a combination of rotten onions and turpentine garnished with a gym sock. Separately, it is a lipid-rich fruit which describes its creamy texture and ability to taste like ice cream once stored in the freezer for an adequate time. The anatomy of a Durian interestingly resembles the spikey-ness of a hedgehog and the flesh of the fruit resembling a washboard stomach at its prime. Durian is most pungent when it has ripen and its at this point the shell becomes less rigid so it can be easier to be broken and consumed.

In the selected paper, the authors use various softwares to assemble and describe the major players in the draft genome of the aforementioned fruit. They observed upregulation in sulfur (pungent smell) production in durian fruit arils (fruit flesh), expansions in sulfur-related pathway gene families, and that the complexity of the aroma could potentially be linked to the fruit ripening. 

As durian becomes a more desirable fruit world-wide and its production is scaled globally, it would be imperative to draw focus on its contribution to biomass. The husk, locules (rind), and seed contributes to about 60% waste after the arils are harvested and consumed. Based on the available annotation and research performed on this fruit, I would like to find out if there is a functional gene that reduces the size of seeds or reducing the overall contribution to biomass.

## Data, data management, and softwares

### Estimate space required + how data will be organized
*Durio z.* has a total genome length of 715.23 megabases. The PacBio and Illumina SRA records are 27.4Gb and 83.3Gb respectively. I suspect I will have to delete files after each step up until completing assembly; e.g. delete after aligning, and assembly. I will make sure I will have a clear + coherent directory tree and naming scheme for all steps and files.

<details>
  <summary>Transcriptomic data</summary>
  
  | Species | SRA record | Location of Extraction |
  | --- | --- | --- |
  | *Durio z.* Musang King | SRR6040092 | leaf |
  | *Durio z.* Musang King | SRR6040093 | root |
  | *Durio z.* Musang King | SRR6040094 | aril 2 |
  | *Durio z.* Musang King | SRR6040096 | stem |
  | *Durio z.* Musang King | SRR6040097 | aril 3 |
  | *Durio z.* Monthong | SRR6156066 | aril 2|
  | *Durio z.* Monthong | SRR6156067 | aril 3|
  | *Durio z.* Monthong | SRR6156069 | aril 1|
</details>

| Type of Data | Source | Details |
| --- | --- | --- |
| Annotation for *Durio Zibethinus* | NCBI Genome | [GCF_002303985.1](https://www.ncbi.nlm.nih.gov/assembly/GCF_002303985.1/) |

| Software | Analysis |
| --- | --- |
| Canu | Long-read assembly |
| Pilon | Improve draft assembly |
| Trinity | RNA-seq assembly |
| Maker2 | Annotation |
| BWA, STAR, Samtools | Aligner |
| HTseq, Deseq2 | Differential Analysis |



## Methods

**Quality Check**
PacBio
Illumina

**Genome Assembly**
The genome of Durio z. is a whopping size of [715.23 Mb](https://www.ncbi.nlm.nih.gov/genome/?term=txid66656[orgn]) and would take too long to analyze in its entirety. Thus, I have taken [scaffold 10](https://www.ncbi.nlm.nih.gov/Traces/wgs/NSDW01?display=contigs) and its respective transcriptome.
1. Assemble PacBio reads with [Canu](https://canu.readthedocs.io/en/latest/quick-start.html). Canu performs the correction and trimming step in addition to the assembly. The options used can be seen in the pacbio-canu.sh bash script.
2. Correct step 1 with Illumina reads using [Pilon](https://github.com/broadinstitute/pilon/wiki). The preprocessing steps to this entails using [bwa mem](http://bio-bwa.sourceforge.net/bwa.shtml) to align both the Canu produced assembly and paired Illumina reads. After the bwa step, which produced a SAM (sequence alignment map) file, I used [samtools](http://www.htslib.org/doc/samtools.html) to generate a binary version of the alignment map. The options used can be seen in the illumina-bwa.sh bash script.

**Transcriptome Assembly**


**Assembly Evaluation**
I used QUAST to evaluate the corrected genome assembly produced by Pilon and the results show.

**Annotation**

**Differential Expression**


## Time Plan

#### Week 14, March 30 - April 3
- [x] Familiarize with UPPMAX interface and tools.
- [x] Draft a near-complete project plan

#### Week 15, April 6 - April 11
- [x] Assemble *Durio z.* genome 

#### Week 16, April 13 - April 18
- [x] Transcriptome assembly (not sure if using RNA-seq data from SRA or directly from the genome assembly)

#### Week 17, April 20 - April 25
- [x] Use Maker2 and annotation genome + transcriptomic assembly. Compare it to see if need for correction with the existing annotation file for draft genome presented by paper.

#### Week 18, April 27 - May 1
- [ ] Use either HTseq or Deseq2 (R library) to perform differential analysis.
- [ ] Perform comparative analysis on genes with homologous species that can give me some information on identifying functional information regarding the husk, locules, and seed. 

#### Week 20, May 4 - May 8
- UPPMAX was down, nothing done this week.

#### Week 20, May 11 - May 15
- [ ] Extra analyses: assembly with different parameters, assembly evaluation with more than one method, and deeper analysis of differential exp. analyses (e.g. different comparisons).

#### Week 20, May 18 - May 25
- [ ] Wrap up the README
- [ ] Prepare 10 min. presentation slides and for 5 min. discussion.

## Results
## Limitations
## Discussion
