# Genome Analysis, VT2020
Genome Analysis, VT2020 project course at Uppsala University. Bioinformatics, MSc. The aims of this course is to utilize available bioinformatic tools and cloud resources to answer a scientific question that will require computationally heavy analyses. This project will be based on a [paper](https://www.nature.com/articles/ng.3972) about the draft genome of the tropical fruit durian (*Durio zibethinus*).

## Introduction
*Durio zibethinus*, other known as Durian, is a fruit indigenous to South East Asia and bears a dense nutrient profile of impressive vitamins and mineral contents, amongst other consitutients. This species, amongst other 30 subsumed species of the genus, is the most commonly appearing and consumed in SEA. It has a very distinct aroma and some might even describe it to be a combination of rotten onions and turpentine garnished with a gym sock. Separately, it is a lipid-rich fruit which describes its creamy texture and ability to taste like ice cream once stored in the freezer for an adequate time. The anatomy of a Durian interestingly resembles the spikey-ness of a hedgehog and the flesh of the fruit resembling a washboard stomach at its prime. Durian is most pungent when it has ripen and its at this point the shell becomes less rigid so it can be easier to be broken and consumed.

In the selected paper, the authors use various softwares to assemble and describe the major players in the draft genome of the aforementioned fruit. They observed upregulation in sulfur (pungent smell) production in durian fruit arils (fruit flesh), expansions in sulfur-related pathway gene families, and that the complexity of the aroma could potentially be linked to the fruit ripening. 

As durian becomes a more desirable fruit world-wide and its production is scaled globally, it would be imperative to draw focus on its contribution to biomass. The husk, locules (rind), and seed contributes to about 60% waste after the arils are harvested and consumed. Based on the available annotation and research performed on this fruit, I would like to find out if there is a functional gene that reduces the size of seeds or reducing the overall contribution to biomass.

## Data, data management, and softwares

### Estimate space required + how data will be organized
*Durio z.* has a total genome length of 715.23 megabases. The PacBio and Illumina SRA records are 27.4Gb and 83.3Gb respectively. I suspect I will have to delete files after each step up until completing assembly; e.g. delete after aligning, and assembly. I will make sure I will have a clear + coherent directory tree and naming scheme for all steps and files.

| Type of data | Source | Description |
| --- | --- | --- |
| Whole Genome Sequence | SRA | Assemble the PacBio record and correct with the Illumina record. |
| Annotation for *Durio Zibethinus* | NCBI Genome | GCF_002303985.1 |

[more to fill out]

| Software | Analysis |
| --- | --- |
| Canu | Long-read assembly |
| Pilon | Improve draft assembly |
| Trinity | RNA-seq assembly |
| Maker2 | Annotation |
| BWA, STAR, Samtools | Aligner |
| HTseq, Deseq2 | Differential Analysis |

## Methods

**Genome assembly.**

**Transcriptome assembly.**

**Genome annotation.**

**Phylogeny.**


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

## Results
## Limitations
## Discussion
