<h1 align="center">anat-fslswap-app</h1>

<p align="center">
  Reorients or flips a T1-weighted image by swapping or negating its axes with FSL fslswapdim (default -x y z, a left-right flip).
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.668"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.668-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Reorients or flips a T1-weighted image by swapping or negating its axes with FSL fslswapdim (default -x y z, a left-right flip).**

Runs FSL 5.0.11 fslswapdim on the input T1w with the given axis specification and returns the reoriented image. Use it to fix images whose left-right (or other) axis is flipped, typically on unprocessed NIfTI files before further processing. fslswapdim changes the voxel order and the header together, so check the result visually. The same code also handles DWI (with bvecs) and BOLD inputs, but this App registers only a T1w input.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` |
| **Outputs** | `neuro/anat/t1w` |
| **Container** | `brainlife/fsl:5.0.11` |
| **Resources** | 4 GB memory · 0.25 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.668](https://doi.org/10.25663/brainlife.app.668) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `anat` | `neuro/anat/t1w` | yes | T1-weighted image to reorient. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `out_dir` | `neuro/anat/t1w` | Reoriented T1-weighted image (t1.nii.gz). |

<details>
<summary><b>Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `swap_dimensions` | string | `-x y z` | new x,y,z axes in terms of the old axes |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.668](https://doi.org/10.25663/brainlife.app.668), choose `neuro/anat/t1w` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/anat/t1w`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/fsl:5.0.11`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "t1": "/path/to/anat/t1",
       "swap_dimensions": "-x y z"
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- anat-fslswap-app. brainlife.io App. [doi:10.25663/brainlife.app.668](https://doi.org/10.25663/brainlife.app.668)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Hanna Willis
- Rebecca Truby
- Giulia Berto

**Contributors**

- Saad Jbabdi
- Franco Pestilli

## License

See [LICENSE](LICENSE).
