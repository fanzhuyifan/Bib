Welcome to John's bibliography file (begun from a seed of Rob Schapire
and Yoram Singer). Please be gentle when making changes to the
bibliography file, as it has been built for about 12 years by hand,
and it only takes a few tweaks to make it less useful.

This bib.bib file is very convenient, as you can simply soft-link it
into whatever project you are working on, and then you do not have to
maintain multiple bibliography files.

To soft-link things, use the command

``
ln -s [path-to-bib]/bib.bib [path-to-desired-place]
``

To use the soft-link in other git repositories, put `UtilityFiles/pre-commit`
inside `.git/hooks`. The pre-commit hook replaces soft-linked files with their
actual content. To avoid issues with your rebase commands, surround them with
`git stash` and `git stash pop`.

The aggressively precise formatting also means that citations are
simpler within the file, and easier to find. As a corollary to this,
please *use* this bib file--it is convenient! Do not start your own
ones!

*** Adding new entries to the bib file ***

I would love it if you add entries to this file! But I also do not love
it when the formatting is wrong. (For example, if you copied something
from Google Scholar, it is wrong.) As a consequence of this, we are now
using a standard code review cycle on this. A good use pattern is to try
to merge your branch into the master (pushing your changes to the
master branch) at least once a week or so, so that branches
do no become too out of synchronization with one another.

To commit edits to the bib, you'll need to create a branch, do your
edits in that branch, then issue a pull request to the master
branch. Currently I am the only reviewer who can approve pull
requests. Here are the steps in somewhat more detail:

In your terminal, create a branch. The command for this is

``
git branch your-branch-name
``

``
git checkout your-branch-name
``

Once you've done these, you'll be on your branch. Now, you can edit
your branch as you see fit, and once you've made your edits and
committed them via

``
git add bib.bib
``

``
git commit -m "This is a description of the edits I've made"
``

you can do push your edits to the main server via ``git push``.
This may flag some issues of upstream setting; typically you can fix this by
instead running

``
git push --set-upstream origin your-branch-name
``

Now that you've pushed your branch to the server, you might want to
do one of two things: merging the master branch into yours (so that
your branch reflects all the changes of the master) or
merging your branch into the master. For the former (merging the
master into your branch) it's not so hard. You should simply checkout
the master, pull it to make sure it's up to date, then switch back
to your branch and merge in the master. The commands for this are

```
git checkout master
git pull
git checkout your-branch-name
git merge master
```

Now your branch reflects all the changes made to the master.  To get
your changes into the master, once you've pushed your branch to the
server, you need to create a pull request. To do this, go to
[the branches webpage](https://github.com/jduchi/Bib/branches), then on the branch you've
just pushed, click "Create" a pull request. You'll get a window with a
place to enter a description and reviewers. (Currently the only
reviewer is John.)

Once we approve the changes, you can merge them into the master. Once
you've merged into the master, to check out the freshest version of
the repository, just issue the command

``
git checkout master
``

``
git pull
``

To check the branches on your local machine, you can always issue the
command ``git branch -v``, and to delete a local branch once it has
been merged, use ``git branch -d your-branch-name``.

*** Entry format ***

Entries are in alphabetical order by first author's last name, and
each has a key given by first author's full last name, then first two
initials of each additional author, followed by the 2-digit year.
As a typical example, here is

@article{DuchiBaWa12,  
&nbsp;&nbsp;author = {John C. Duchi and Peter L. Bartlett and Martin J. Wainwright},  
&nbsp;&nbsp;title = {Randomized Smoothing for Stochastic Optimization},  
&nbsp;&nbsp;year = 2012,  
&nbsp;&nbsp;journal = siopt,  
&nbsp;&nbsp;volume = 22,  
&nbsp;&nbsp;number = 2,  
&nbsp;&nbsp;pages = {674--701},  
}

Note that this has an abbreviated journal. This is because there are
strings at the top of the file to allow consistent formatting. Please use those
whenever possible; e.g., NIPS should be

booktitle = nips2013

where the last four digits indicate which year of NIPS it is.

*** Formatting instructions ***

When entering things from the arXiv, use the format

@article{DuchiGlNa16,  
&nbsp;&nbsp;title={Statistics of Robust Optimization: A Generalized Empirical  
&nbsp;&nbsp;&nbsp;&nbsp;Likelihood Approach},  
&nbsp;&nbsp;author={John C. Duchi and Peter W. Glynn and Hongseok Namkoong},  
&nbsp;&nbsp;year=2016,  
&nbsp;&nbsp;journal={arXiv:1610.03425 [stat.ML]},  
}


Note that you should *never* use

journal = {arXiv preprint arXiv:1610.03425}

as that does not actually reflect arXiv's desired citation style. You
should include the subject area.  Relatedly, do not simply download
Google's citations, as they are typically wrong and have bad capitalization,
etc.

*** Comments and Common Errors ***

In the title field, any letters that should be capitalized must be
surrounded by brackets, i.e.

title = {Some cool things called {M}arkov chains}

rather than

title = {Some cool things called Markov chains}

as latex will lower-case Markov in the second example.

