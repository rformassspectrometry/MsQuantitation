[![codecov](https://codecov.io/gh/rformassspectrometry/MsQuantitation/branch/main/graph/badge.svg?token=R12NIC9611)](https://codecov.io/gh/rformassspectrometry/MsQuantitation)

# Quantitation of Mass Spectrometry Data

The `MsQuantitation` package quantitates raw mass spectrometry data
extracted from
[`Spectra`](https://rformassspectrometry.github.io/Spectra/) objects
into [`QFeatures`](https://rformassspectrometry.github.io/QFeatures/)
instances.

## Quantitation or quantification?

The two words are mostly synonyms, although quantification/quantify is
[more widely
used](https://english.stackexchange.com/questions/114448/is-quantitate-a-synonym-for-quantify-or-just-a-misnomer)
as quantitation/quantitate. This
[source](https://www.askdifference.com/quantify-vs-quantitate/) seemed
to suggest a minor difference:

- **Quantify** (verb): To assign a quantity to or to determine the
  value of (a variable or expression).
  
- **Quantitate** (verb): To measure the quantity of, especially with
  high accuracy and taking uncertainty into account, as in
  quantitative analysis.
  
Dr J. H. Marshall, Associate Editor Oxford English Dictionary, in
[slides](https://abrf.org/sites/default/files/temp/RGs/PRG/abrf_presentation_2006.pdf)
by Chris Turk and the ABRF PRG2006 Research Study on Relative
Quantification (see last slide), mentions that the **actual meaning of
the two words appears to be the same**, and some technical glossaries
state explicitly that they are interchangeable.

- **Quantification** is the usual word. It was introduced by logicians
  in the mid 19th century, but from the late 19th century was adopted
  by mathematicians, scientists, and writers in a wide range of
  fields.

- **Quantitation** was introduced by statisticians in the late 19th
  century, on the grounds that it was slightly shorter, and avoided
  confusion with the concept of quantification in logic. However, it
  did not become so widely used, except in connection with certain
  kinds of scientific analysis, particularly in biochemistry and
  related fields, which is the context of all the examples cited in
  the complete Oxford English Dictionary. It is perhaps kept current in
  these fields because of its constant use alongside the related
  adjective 'quantitative'.

Based on the above, the name of this package was chosen to officially
be `MsQuantitation`, but it could just has been `MsQuantification`.

## Contributions

Please the *R for Mass Spectrometry* [code of conduct](https://rformassspectrometry.github.io/RforMassSpectrometry/articles/RforMassSpectrometry.html#code-of-conduct) and [contribution guidelines](https://rformassspectrometry.github.io/RforMassSpectrometry/articles/RforMassSpectrometry.html#contributions).
