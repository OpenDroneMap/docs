## OpenDroneMap Docs

Documentation for [OpenDroneMap](https://github.com/OpenDroneMap/OpenDroneMap).

### Development

_(on OSX)_

```bash
# install python
brew install python3
# check installation
python --version
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
Go to the logged URL to access your site (e.g. `http://127.0.0.1:8000`).
To stop the server simply press `Ctrl+C`.


