## OpenDroneMap Docs

Documentation for [OpenDroneMap](https://github.com/OpenDroneMap/OpenDroneMap).

## Development

### Environment

_(on OSX)_

```bash
# install python
brew install python3
# install virtualenv
pip install virtualenv
# create Python environment
virtualenv -p /usr/local/bin/python3 venv
# open the Python environment
source venv/bin/activate
# install requirements
pip install -r requirements.txt
```

More on [`virtualenv`](https://virtualenv.pypa.io/en/stable/).

Use [`sphinx-autobuild`](https://github.com/GaretJax/sphinx-autobuild) to automatically watch for changes and rebuild the html site using:
```
make livehtml
```

To stop the server press `Ctrl+C`.

### Travis-CI

Travis-CI docs for [Building a Python Project](https://docs.travis-ci.com/user/languages/python/) and [GitHub Pages Deployment](https://docs.travis-ci.com/user/deployment/pages/). Personal access token with 'public_repo - Access public repositories' permissions created and used it in `travis encrypt GH_TOKEN=my_github_token --add env.matrix` as described in the [Travis-CI docs](https://docs.travis-ci.com/user/environment-variables#Encrypting-environment-variables).