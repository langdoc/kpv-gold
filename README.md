# kpv-gold

This repository contains human-verified and annotated Komi Zyrian materials which are available either in Public Domain or CC-BY. The idea is to collect annotated sentences which either are completely tagged automatically or have been manually verified. The format currently in use is [CoNLL-U](http://universaldependencies.org/format.html).

The Komi-Zyrian gold corpus will probably have somewhat peculiar structure, and it connects to different datasets which contain complete non-annotated texts. As far as I see, there are three (?) different gold corpora under preparation. Ideally all data will be selected according to some finer design principles, but we have to be able to deliver all of it openly -- there is no sense or ethical grounds to manually verify closed data:

- Universal Dependency annotations for individual sentences
- Phonemically aligned individual utterances so that we can deal better with forced alignation and speech recognition later on
- Code switching annotations so that Russian-Komi contact phenomena can be better understood / modeled 
- Possibly line-based annotations for hand written Komi transcriptions, as there are many of those, and [Transkribus](https://transkribus.eu/Transkribus/) would probably perform well on that

The work is conducted since April 2017 by Niko Partanen in [LATTICE](http://www.lattice.cnrs.fr/) laboratory in Paris. Please contact Niko Partanen by email (nikotapiopartanen@gmail.com) in case there are questions or comments. Or even better, open an issue in this repository!
