## Style Guide

#### Code style

In order to make sure the TeX code is easy to maintain, please make sure to only
PR clean code.

Here are some guides on code an TeX style:

- Add labels to every chapter and section. Add labels as well to named theorems
  and lemmas you will refer to in the future.
- Use references instead of section, theorem, lemma, or exercise (or etc.)
  numbers
- If a theorem has a name (e.g. Fubini's Theorem), put the theorem name in the
  theorem notes
- Do not use `\displaystyle` for any inline math equations. Instead prefer a
  full block
- Separate major topics into chapter, topics into sections.
- Follow the major notations.

The chktex github action has been integrated into the repository as well. If
your TeX has stylistic issues (e.g. with spacing, exponents, improper use of
ellipses etc.) your PR will not be able to be merged until you fix them.

If you would like to request a configuration change for chktex, please contact a
moderator.

Additionally, there is a github app called restyled that will restyle code for
you automatically, but it currently only fixes small whitespace issues (TeX
support may come in the future).

#### Prose style

Generally, prose style is pretty individual, but there are plenty of guides on
the internet on how to write good prose for mathematical audiences. For examples
see:
[Bertsekas's Guide](http://newslab.ece.ohio-state.edu/for%20students/resources/tenrules.pdf),
or [Berndt's Guide](https://faculty.math.illinois.edu/~berndt/writingmath.pdf)
for examples

What's most important is that when you are writing you keep the following key
tenants in mind:

1. Be clear - a good way to tell if your writing is clear is to come back to it
   several hours later and read it over. You will also get feedback on this in
   your PR if needed.
2. Provide intuition - when giving a theorem or a definition or a proof, you
   should add some commentary to help readers understand the context in which
   the result was developed and/or the context in which it is used in modern
   math. For example, when discussing the definition of Haar measure you might
   talk specifically about the geometric contructions or its use on the
   classical compact groups.
3. Add images as needed - Not everything requires visualization but generally if
   if you are giving any specific examples or counter examples of functions,
   shapes, or the likes, you should add an image. If you find one on the
   internet you must cite it (see below) but you can also generate one with a
   program like [inkscape](https://inkscape.org/).
4. Do not delegate major results - Proofs for major theorems should be written
   out and not left to the reader. Minor theorems and propositions are fine for
   exercises, but major results should have a written proof or at least a strong
   outline (depending on required depth for the result and the relevance for
   towards the text)
5. Do put necessary pre-reqs in the appendix - For non-standard results or
   results from off-topic subjects that a reader might not have encountered yet,
   put them in the appendix and reference them in the text with a label/ref
   link.

#### Citations

Please make sure that if you use any reference material for writing your section
that you add the reference material in the
[main bibliography file](https://github.com/Clopen-Analysis/latex/blob/main/clopen_analysis.bib)
You should include the reference material in the bibliography even if it is a
well known result.

Materials listed in the `.bib` file should give an unambigious name to the
publication to prevent issues with multiple citations. The general format you
should use is `{lastname}{year}{identifier}` e.g. `rudin1978real` for citing
papa-Rudin. If you are using specific results that are unique to a certain
reference (e.g. a particular proof of a theorem or reference to results from a
research article), then you should cite that specifically within the TeX file.

PRs that name specific materials but do not provide citations will be rejected.
Moreover, you cannot just copy from a book directly as that is plagarism. Please
provide original contributions only.

Please use the following BibTeX classes for your citations

- `@book` for any textbook, textbook exerpt, or research monograph
- `@inbook` for any chapter/page range from a book (e.g. citations for unrelated
  topics where you only expect the book to be referred to once in notes)
- `@article` for any research publication in a referreed journal
- `@unpublished` for any unpublished TeX documents or pre-prints (e.g. lecture
  notes that you professor has put on his/her/their website)
- `@inproceedings` for presentations in a conference
- `@masterthesis` and `@phdthesis` for citing results from a particular thesis

If for the title you need any special characters please use the BibTeX supported
accents E.g. `Erd\H{o}s` instead of `Paul Erdős`.

For more information on how to use BibTeX, please see the
[BibTeX website](http://www.bibtex.org/).
