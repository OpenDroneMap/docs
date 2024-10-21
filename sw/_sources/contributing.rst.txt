#######################################
How to Contribute and Request Features
#######################################

How To Request Features
=======================

All software needs user feedback and feature requests, to grow and maintain
alignment with the needs of its users.

OpenDroneMap is FOSS software.  Free and open source (FOSS) projects are interesting
from the inside and outside: from the outside, successful ones feel like they should be able
to do anything, and itâ€™s hard to know what a reasonable request is. From the inside of a
project, they can feel very resource constrained: largely by time, money, and opportunity
overload.

**Demanding that a feature be implemented is probably not going to convince the development team to do so**. Imagine
if somebody knocked on your door and asked you to "stop reading this page right now and come to my house to cook me dinner!". Your first response might very reasonably be "who on earth is this person and why should I spend my time and energy fulfilling his agenda instead of my own?".

**Suggesting** that a feature be implemented is a more effective (and cordial) way to ask for new features, especially if you're prepared to offer some of your own resources (time, funds or both) to help get the feature implemented. Explaining why
*your* suggestion can benefit others can also help. If the feature benefits you exclusively, it might be harder to convince others to do the work for you.

A feature request can be submitted as issues on the applicable Github repository (e.g.,
`WebODM <https://github.com/OpenDroneMap/WebODM/issues>`_ or `ODM <https://github.com/OpenDroneMap/ODM/issues>`_
or similar) or more simply as a discussion topic on `the community forum <https://community.opendronemap.org/>`_.
Try to start by searching these sources to see if someone else has already brought it up.  Sometimes a feature is already in
the works, or has at least been discussed.

To request the addition of support for new drone cameras: please share a set of test images on the `datasets channel on the forum <https://community.opendronemap.org/c/datasets/10>`_. Without test images there's not much the developers can do.

And importantly, the trick is to listen: if someone within the project says: "This is a big lift,
we need MONEY or TIME or SOMEONE TO HELP CODE IT" (or possibly a combination of the three)
then there are two answers that work really well in response:

    *Ok. I didnâ€™t know it was a big feature request! I hope someone comes along with the necessary resources. As a community member, I would be happy to be an early user and tester!*

or

    *Letâ€™s figure out if we can put together the resources to get this done! Hereâ€™s what I can contribute toward it: â€¦*

We are glad you are excited to see new features added to the project.  Some new features need support,
and some are easier to implement.  We'll do our best to help you understand where your request falls, and
we appreciate any support you can provide.


How To Contribute
=================

OpenDroneMap relies on community contributions. You can contribute in many ways, even if you are not a programmer.

Community Forum
---------------

If you are looking to get involved, are stuck on a problem, or want to reach out, `the forum <https://community.opendronemap.org/>`_ is a great place to start. You may find your questions already answered or else you can find other useful tips and resources. You can also contribute your open access datasets for others to explore. It is a good place go before submitting bug reports or getting in touch with developers before writing a new feature.

Reporting Bugs
--------------

Bugs are tracked as Github issues. Please create an issue in the repository and tag it with the Bug tag.

Explain the problem and include additional details to help maintainers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you run ODM (Docker, Vagrant, etc), e.g. which command exactly you used in the terminal. When listing steps, **don't just say what you did, but explain how you did it.**
* **Provide specific examples to demonstrate the steps.** Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use `Markdown code blocks <https://help.github.com/articles/markdown-basics/#multiple-lines>`_.
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. You can use `this tool to record GIFs on macOS and Windows <http://www.cockos.com/licecap/>`_, and `this tool <https://github.com/colinkeenan/silentcast>`_ or `this one <https://github.com/GNOME/byzanz>`_ on Linux.
* **If the problem is related to performance,** please post your machine's specs (host and guest machine).
* **If the problem wasn't triggered by a specific action,** describe what you were doing before the problem happened and share more information using the guidelines below.

Include details about your configuration and environment:

* **Which version of ODM are you using?** A stable release? a clone of master?
* **What's the name and version of the OS you're using?**
* **Are you running ODM in a virtual machine or Docker?** If so, which VM software are you using and which operating systems and versions are used for the host and the guest?

Template For Submitting Bug Reports
```````````````````````````````````
::

    [Short description of problem here]

    **Reproduction Steps:**

    1. [First Step]
    2. [Second Step]
    3. [Other Steps...]

    **Expected behavior:**

    [Describe expected behavior here]

    **Observed behavior:**

    [Describe observed behavior here]

    **Screenshots and GIFs**

    ![Screenshots and GIFs which follow reproduction steps to demonstrate the problem](url)

    **ODM version:** [Enter ODM version here]
    **OS and version:** [Enter OS name and version here]

    **Additional information:**

    * Problem started happening recently, didn't happen in an older version of ODM: [Yes/No]
    * Problem can be reliably reproduced, doesn't happen randomly: [Yes/No]
    * Problem happens with all datasets and projects, not only some datasets or projects: [Yes/No]

Pull Requests
-------------

* Include screenshots and animated GIFs in your pull request whenever possible.
* Follow the PEP8 Python Style Guide.
* End files with a newline.
* Avoid platform-dependent code:
    * Use require('fs-plus').getHomeDirectory() to get the home directory.
    * Use path.join() to concatenate filenames.
    * Use os.tmpdir() rather than /tmp when you need to reference the temporary directory.
* Using a plain return when returning explicitly at the end of a function.
    * Not return null, return undefined, null, or undefined


`Learn to edit <https://github.com/opendronemap/docs#how-to-make-your-first-contribution>`_ and help improve `this page <https://github.com/OpenDroneMap/docs/blob/publish/source/contributing.rst>`_!
